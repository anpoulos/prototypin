
if(flashTimer > 0){
	flashTimer -= 1;
	if(owner != undefined){
		owner.image_blend = c_red;
		if(flashTimer <= 0){
			owner.image_blend = owner.originalImageBlend;	
		}	
	}
	else{
		image_blend = c_red;
		if(flashTimer <= 0){
			image_blend = c_white;	
		}	
	}	
}