package com.voltic.starlingpunk
{
	import com.saia.starlingPunk.SPEntity;
	import com.saia.starlingPunk.SPMask;
	
	import flash.utils.Dictionary;
	
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * @author Ben Follington 2013
	 * Extension of SPEntity allowing very simple management of animations
	 */
	public class SPAnimatedEntity extends SPEntity
	{
		
		protected var frames:Dictionary = new Dictionary();
		protected var animations:Dictionary = new Dictionary();
		
		protected var currentAnimation:String = "";
		
		public function SPAnimatedEntity(x:Number=0, y:Number=0, type:String="", mask:SPMask=null)
		{
			super(x, y, type, mask);
		}
		
		/* Normal Overrides
		 * ================
		 */
		
		override public function added():void 
		{
			super.added();
			setupAnimations();
		}
		
		override public function removed():void 
		{
			removeChildren(0, -1, true);
			super.removed();
		}
		
		override public function update():void 
		{
			super.update();
			
		}
		
		/**
		 * Override this. Look within the body one for an example definition (commented out) 
		 * 
		 */		
		protected function setupAnimations():void 
		{
			/*var textureAtlas:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ExampleAssets.ATLAS_TEXTURE()),
															 XML(new ExampleAssets.ATLAS_DATA()));
			
			addFrame(textureAtlas, "burger");
			addFrame(textureAtlas, "goal");
			
			addAnimation("normal", [getFrame("burger"), getFrame("goal")], 7, true);
			
			setAnimation("normal");*/
		}
		
		/* Utility Functions
		* ================
		*/
		
		/**
		 * Get the name of the current animation. 
		 * @return Animation name
		 * 
		 */
		public function get playingAnimation():String {	return currentAnimation; }
		
		/**
		 * Get all frames staring with a certain prefix from an atlas. 
		 * @param atlas Which atlas to read from
		 * @param prefix The prefix of the frames
		 * @return A Vector of Frames matching
		 * 
		 */
		protected function getFrames(atlas:TextureAtlas, prefix:String):Vector.<Texture>
		{
			return atlas.getTextures(prefix);
		}
		
		/**
		 * Add a definition of a frame to the frames list.
		 * 
		 * Note: this is purely for readability, you may prefer to manually create
		 * your lists of frames for animations for more flexibility. 
		 * @param atlas The atlas to read from
		 * @param name The name of the image to read
		 * @param frameName (optional) Specify a name for the frame in the frame list, if blank the name of the image is used
		 * 
		 */
		protected function addFrame(atlas:TextureAtlas, name:String, frameName:String=""):void
		{
			if (frameName == "") frames[name] = atlas.getTexture(name);
			else 				 frames[frameName] = atlas.getTexture(name);
		}
		
		/**
		 * Get a frame from the list of frames using the specified name. 
		 * @param name Which frame to get
		 * @return The frame texture
		 * 
		 */
		protected function getFrame(name:String):Texture
		{
			return frames[name];
		}
		
		/**
		 * Add a new animation definition to the Entity. 
		 * @param name The name to save the animation under
		 * @param frames A Vector of Textures
		 * @param speed Frames Per Second
		 * @param loop Loops?
		 * 
		 */		
		protected function addAnimation(name:String, frames:Array, speed:Number, loop:Boolean=false):void
		{
			var vector:Vector.<Texture> = Vector.<Texture>(frames);
			
			animations[name] = new MovieClip(vector, speed);
			animations[name].loop = loop;
		}
		
		/**
		 * Change the speed of the current animation. This will not update
		 * the speed set in the definition of the animation. 
		 * @param speed The new Frames Per Second
		 * 
		 */		
		protected function setAnimationSpeed(speed:Number):void
		{
			animations[currentAnimation].fps = speed;
		}
		
		/**
		 * Changes the current Animation of the sprite to the specified animation name
		 * @param anim Name of animation to change to
		 */
		protected function setAnimation(anim:String):void
		{
			if (animations[currentAnimation])
			{
				removeChild(animations[currentAnimation]);
				Starling.juggler.remove(animations[currentAnimation]);
			}
			
			currentAnimation = anim;
			addChild(animations[currentAnimation]);
			Starling.juggler.add(animations[currentAnimation]);	
		}
	}
}