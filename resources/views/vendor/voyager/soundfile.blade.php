<audio controls id="mp3ID" preload="auto" src="{{$sound}}"> 
    
</audio>

<script type="text/javascript">
 var startTime = {{$start}};
 var endTime = {{$end}};
 var delaySec = endTime - startTime;
 var delayMillis = delaySec * 1000;
 myAudio=document.getElementById('mp3ID');
 myAudio.addEventListener('canplaythrough', function() {
     if(this.currentTime < startTime){this.currentTime = startTime;}
     this.play();
     setTimeout(function(){
         document.getElementById('mp3ID').pause();
     }, delayMillis); 

 });
</script>
