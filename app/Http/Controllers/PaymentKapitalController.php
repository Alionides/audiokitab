<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//use App\Models\{ Payment };
use Illuminate\Support\Facades\{DB, File, Hash, Storage, Validator, Config, Auth, Mail};
use SimpleXMLElement;
use App\Traits\Log;

use App\Payment;
use App\Subscribeorder;
use App\Bookorder;





class PaymentKapitalController extends Controller
{
    protected $serviceUrl = 'https://e-commerce.kapitalbank.az:5443/Exec';
    protected $cert = "kapitalbank_certificates/test.crt";
    protected $key = "kapitalbank_certificates/test.key";
    protected $merchant_id = 'E1000010';
    protected $language = 'RU';
    const PORT = 5443;

    private  $amount = 0;
    private  $type = 0;
    private  $payment_type_id = 0;


    public function __construct()
    {
        // if($this->amount > 0){
        //     $this->amount = $this->amount;
        // }
        if (Storage::disk('local')->exists($this->cert)) {
            $this->cert = storage_path('app/'.$this->cert);
        } else {
            throw new \Exception("Certificate does not exists: $this->cert");
        }

        if (Storage::disk('local')->exists($this->key)) {
            $this->key = storage_path('app/'.$this->key);
        } else {
            throw new \Exception("Key does not exists: $this->key");
        }
    }

    public function index(){
       //return $this->amount;
    }

    public function setAmount($arr)
    {
        $this -> amount = $arr['amount'];
        $this -> type = $arr['type'];
        $this -> payment_type_id = $arr['payment_type_id'];
    }

   public function curl($xml){
       $url = $this->serviceUrl;
       $ch = curl_init();
       curl_setopt($ch, CURLOPT_PORT, self::PORT);
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
       curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");


       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
       curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);

       curl_setopt($ch, CURLOPT_SSLCERT, $this->cert);
       curl_setopt($ch, CURLOPT_SSLKEY, $this->key);

       curl_setopt($ch, CURLOPT_POSTFIELDS, $xml);

       //Error handling and return result
       $data = curl_exec($ch);
       if ($data === false) {
           $result = curl_error($ch);
       } else {
           $result = $data;
       }

       // Close handle
       curl_close($ch);

       return $result;
   }

   public function createTestOrder(){

       //echo header("Location: ");

       //return redirect()->to('indexs');

       $order_data = array(
           'payment_type_id' => $this->payment_type_id,
           'payment_type' => $this->type,
           'merchant' => $this->merchant_id,
           'amount' => $this->amount,
           'currency' => 944,
           'description' => 'Audiobook Purchase',
           'lang' => 'AZ'
       );


       $xml = '<?xml version="1.0" encoding="UTF-8"?>
        <TKKPG>
        <Request>
            <Operation>CreateOrder</Operation>
            <Language>'.$order_data['lang'].'</Language>
            <Order>
                <OrderType>Purchase</OrderType>
                <Merchant>'.$order_data['merchant'].'</Merchant>
                <Amount>'.$order_data['amount'].'</Amount>
                <Currency>'.$order_data['currency'].'</Currency>
                <Description>'.$order_data['description'].'</Description>
                <ApproveURL>http://127.0.0.1:8000/approve</ApproveURL>
                <CancelURL>http://127.0.0.1:8000/cancel</CancelURL>
                <DeclineURL>http://127.0.0.1:8000/decline</DeclineURL>
            </Order>
        </Request>
        </TKKPG>
        ';
       //return $xml;
       // ?type='.$this->type.'&subscribeid='.$this->subscribe_order_id.'

       $result = $this->curl($xml);

       return $this->handleCurlResponse($order_data,$result);
       //dd($result);
       // $result;
   }

   public function handleCurlResponse($inital_data, $data){
       $oXML = new SimpleXMLElement($data);
       //dd($oXML);

       $OrderID = $oXML->Response->Order->OrderID;
       $SessionID = $oXML->Response->Order->SessionID;
       $paymentBaseUrl = $oXML->Response->Order->URL;


       Payment::create([
           'amount' => $inital_data['amount'],
           'order_id' => $OrderID,
           'session_id' => $SessionID,
           'payment_type_id' => $inital_data['payment_type_id'],
           'payment_type' => $inital_data['payment_type'],
           'payment_url' => $paymentBaseUrl,
           'staus_code' => $oXML->Response->Status,
           'order_description' => $inital_data['description'],
           'currency' => $inital_data['currency'],
           'language_code' => $inital_data['currency'],
       ]);
       ///
       $redirectUrl = $paymentBaseUrl."?ORDERID=".$OrderID."&SESSIONID=".$SessionID."&";
        //dd($redirectUrl);
       //echo $redirectUrl;

      // return response($redirectUrl);
       return redirect()->to($redirectUrl);

       //return header("Location: ");

   }

   public function approveUrl(Request $request){
       //Log::write('approveUrl','kapitalBank',$request->all());

      // return response($request->xmlmsg);

       $xmlmsg = new SimpleXMLElement($request->xmlmsg);

       $getPaymentRow = Payment::where('order_id', '=', $xmlmsg->OrderID)->first();

       if($getPaymentRow){
           $getPaymentRow->update([
               'order_status' => $xmlmsg->OrderStatus,
           ]);

           $this->getOrderStatus($getPaymentRow);
       }

       if( $xmlmsg->OrderStatus == 'APPROVED'){
        if ($getPaymentRow->payment_type == 1) {
            $subscribe = Subscribeorder::where('id', '=', $getPaymentRow->payment_type_id)->first();
            $subscribe->status = 'APPROVED';
            $subscribe->save();
        }elseif ($getPaymentRow->payment_type == 2) {
            $subscribe = Bookorder::where('id', '=', $getPaymentRow->payment_type_id)->first();
            $subscribe->status = 'APPROVED';
            $subscribe->save();
        }
        

       }

       //return 'approve';
   }

    public function cancelUrl(Request $request){
        //echo $request->xmlmsg;
        $xmlmsg = new SimpleXMLElement($request->xmlmsg);

        Log::write('cancelUrl','kapitalBank',$request->all());


        $getPaymentRow = Payment::where('order_id', '=', $xmlmsg->OrderID)->first();

        if($getPaymentRow){
            $getPaymentRow->update([
                'order_status' => $xmlmsg->OrderStatus,
            ]);
        }

        return 'cancel';
    }

    public function declineUrl(Request $request){
        //dd($request->all());
        Log::write('declineUrl','kapitalBank',$request->all());

        if ($request->filled('xmlmsg')){
            $xmlmsg = new SimpleXMLElement($request->xmlmsg);
            //dd($xmlmsg->OrderStatus);
            $getPaymentRow = Payment::where('order_id', '=', $xmlmsg->OrderID)->first();
            if($getPaymentRow){
                $getPaymentRow->update([
                    'order_status' => $xmlmsg->OrderStatus,
                ]);
            }
        }

        return 'DECLINED';
    }

    //Internet shop must perform the Get Order Status operation for the security purposes and decide whether to provide the service or not depending on the response.
    public function getOrderStatus($data){

        $xml = '<?xml version="1.0" encoding="UTF-8"?>
                <TKKPG>
                    <Request>
                        <Operation>GetOrderStatus</Operation>
                        <Language>'.$this->language.'</Language>
                        <Order>
                            <Merchant>'.$this->merchant_id.'</Merchant>
                            <OrderID>'.$data->order_id.'</OrderID>
                        </Order>
                        <SessionID>'.$data->session_id.'</SessionID>
                    </Request>
                </TKKPG>';

        $response = $this->curl($xml);

        $xmlmsg = new SimpleXMLElement($response);
        //dd($xmlmsg->Response->Status);
        $getPaymentRow = Payment::where('order_id', '=', $xmlmsg->Response->Order->OrderID)->first();
        if($getPaymentRow){
            $getPaymentRow->update([
                'order_check_status' => $xmlmsg->Response->Order->OrderStatus,
                'status_code' => $xmlmsg->Response->Status,
            ]);
        }

        return $response;

    }

    //paymentLogs in admin
    public function paymentLogs(){
        $rows = Payment::latest()->paginate(20);

        return view('back.settings.payment_logs', compact('rows'));
    }
}
