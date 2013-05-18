package com.voltic.starlingpunk  
{
	import com.saia.starlingPunk.SPEntity;
	
	import flash.display.Bitmap;
	
	import spine.AnimationStateData;
	import spine.SkeletonData;
	import spine.SkeletonJson;
	import spine.atlas.Atlas;
	import spine.starling.SkeletonAnimationSprite;
	import spine.starling.StarlingAtlasAttachmentLoader;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * @author Ben Follington 2013
	 * An implementation of an SPEntity that uses a Spine animation
	 * for its graphical display.
	 */
	public class SPSkeletonEntity extends SPEntity 
	{
		
		protected var skeleton:SkeletonAnimationSprite;
		
		private var atlasXml:Object;
		private var atlasTexture:Bitmap;
		private var atlasJson:Object;
		
		/**
		 * Create a new SkeletonEntity, you can specify your spine data files in the constructor or later using
		 * the provided methods.
		 * 
		 */
		public function SPSkeletonEntity(x:Number=0, y:Number=0, name:String="", xml:Object=null, texture:Bitmap=null, json:Object=null) 
		{
			super(x, y, name);
			setXml(xml);
			setTexture(texture);
			setJson(json);
		}
		
		/** Add the XML data for the Skeleton's Atlas */
		public function setXml(xml:Object):void
		{
			atlasXml = xml;
		}
		
		/** Add the Texture for the Skeleton's Atlas */
		public function setTexture(texture:Bitmap):void
		{
			atlasTexture = texture;
		}
		
		/** Add the JSON data for the Skeleton's Animation */
		public function setJson(json:Object):void
		{
			atlasJson = json;
		}
		
		/** Change the visual offset of the skeleton from the SPEntity */
		public function setSkeletonOffset(x:Number, y:Number):void
		{
			skeleton.x = x;
			skeleton.y = y;
		}
	
		//-------------------
		//  overrides
		//-------------------
		
		override public function added():void 
		{
			super.added();
			setupSkeleton();
			setupAnimations();
			addSkeleton();
		}
		
		override public function removed():void 
		{
			removeChildren(0, -1, true);
			Starling.juggler.remove(skeleton);
			super.removed();
		}
	
		override public function update():void 
		{
			super.update();
			
		}
		
		//-------------------
		//  private methods 
		//-------------------
		
		
		private function setupSkeleton():void 
		{	
			var texture:Texture = Texture.fromBitmap(atlasTexture);
			var xml:XML = XML(atlasXml);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			
			var json:SkeletonJson = new SkeletonJson(new StarlingAtlasAttachmentLoader(atlas));
			var skeletonData:SkeletonData = json.readSkeletonData(atlasJson);
			
			var stateData:AnimationStateData = new AnimationStateData(skeletonData);
			
			setupMixing(stateData);
			
			skeleton = new SkeletonAnimationSprite(skeletonData);
			skeleton.setAnimationStateData(stateData);
			
			//The skeleton is exactly at our position
			skeleton.x = 0;
			skeleton.y = 0;
		}
		
		public function setupMixing(stateData:AnimationStateData):void
		{
			//Mixing goes here
			//Looks like:
			//stateData.setMixByName("walk", "jump", 0.2);
			//stateData.setMixByName("jump", "walk", 0.4);
			//stateData.setMixByName("jump", "jump", 0.2);
		}
		
		public function setupAnimations():void
		{
			//Animations would go here
			//Looks like: skeleton.setAnimation("Run", true);
		}
		
		private function addSkeleton():void
		{
			addChild(skeleton);
			Starling.juggler.add(skeleton);
		}
		
	}

}