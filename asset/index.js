define([],function(){
  return {
    init:function($mod){
    	this.initSlider($mod);

    },
    initSlider:function($mod){
    	var $div=$('.J_slider[data-on]',$mod);
    	var curIndex=($div.attr('data-on')||1)-1;
    	var count=$div.attr('data-count')-0;
    	var play=function(direction){
    		if(direction<0){
    			curIndex=curIndex+count-1;
    		}else{
    			curIndex++;
    		}
    		
    		curIndex=curIndex%count;
    		$div.attr('data-on',curIndex+1)
    	};
    	//setInterval(play,3000);
    	$div.on('swipeLeft',play).on('swipeRight',function(){
    		play(-1);
    	})
    }
  }
})
