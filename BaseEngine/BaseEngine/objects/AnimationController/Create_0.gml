
_owner = undefined;

function Initialize(owner){
	_owner = owner;
}

function ChangeSprite(sprite, resetAnimation){
	sprite_index = sprite;
	if(resetAnimation){
		image_index = 0;
	}
}
