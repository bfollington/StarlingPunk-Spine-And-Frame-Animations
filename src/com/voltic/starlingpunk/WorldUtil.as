package com.voltic.starlingpunk 
{
	import com.saia.starlingPunk.SPEngine;
	import com.saia.starlingPunk.SPEntity;
	import com.saia.starlingPunk.SPWorld;
	
	/**
	 * @author Ben Follington 2013
	 * Simple utility class for getting lists of entities from the current
	 * world.
	 * 
	 * Allows an SPEntity to easily get references to other entities in the world.
	 */
	public class WorldUtil
	{
		/** Return a list of all entities who's name matches the given string */
		public static function getEntitiesByName(world:SPWorld, name:String):Vector.<SPEntity>
		{
			var entities:Vector.<SPEntity>;
			entities = world.getAllEntities();
			var results:Vector.<SPEntity> = new <SPEntity>[];
			
			for each (var e:SPEntity in entities)
			{
				if (e.name == name)
				{
					results.push(e);
				}
			}
			
			return results;
		}
		
		/** Return a list of all entities who's type matches the given string */
		public static function getEntitiesByType(world:SPWorld, type:String):Vector.<SPEntity>
		{
			var entities:Vector.<SPEntity>;
			entities = world.getAllEntities();
			var results:Vector.<SPEntity> = new <SPEntity>[];
			
			for each (var e:SPEntity in entities)
			{
				if (e.type == type)
				{
					results.push(e);
				}
			}
			
			return results;
		}
		
		/** Return a list of all entities who's class matches the given class */
		public static function getEntitiesByClass(world:SPWorld, c:Class):Vector.<SPEntity>
		{
			trace("CALLED");
			var entities:Vector.<SPEntity>;
			entities = world.getAllEntities();
			var results:Vector.<SPEntity> = new <SPEntity>[];
			
			for each (var e:SPEntity in entities)
			{
				if (e is c)
				{
					results.push(e);
				}
			}
			
			return results;
		}
	}
}