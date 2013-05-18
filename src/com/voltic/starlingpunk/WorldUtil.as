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
		/**
		 * Get a list of Entities in the world matching the name given. 
		 * @param world Which world to search
		 * @param name The name of the entitie(s)
		 * @return List of Entities
		 * 
		 */		
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
		
		
		/**
		 * Return a list of all entities who's type matches the given string 
		 * @param world The world to search
		 * @param type The string to search the type for
		 * @return List of Entities
		 * 
		 */
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
		
		/**
		 * Return a list of all entities who's class matches the given class 
		 * @param world The world to search
		 * @param c Which class to check for
		 * @return List of Entities
		 * 
		 */		
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