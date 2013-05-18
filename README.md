StarlingPunk-Spine-Runtime-Implementation
=========================================

For the main classes go here: https://github.com/volticgames/StarlingPunk-Spine-And-Frame-Animations/tree/master/src/com/voltic/starlingpunk

This repository includes an entire example project (which is just a modified version of the StarlingPunk example project).

The only files needed to run a Spine animation if you have an existing SP project are: ```com.voltic.SPSkeletonEntity.as```

However, if you want to see a usage example for the class there are two example entities:

```entities.GreenGuy.as & entities.SpineBoy.as```
  
This shows how to extend the class correctly.

This repositary also includes the ```com.voltic.SPAnimatedEntity.as``` class which has a whole bunch of features for frame based animation sequences.

```entities.BurgerFlag.as``` shows a proper implemetation of the class.

Also; ```com.saia.starlingPunkExamples.platformer.worlds.PlatformerLevelOne.as``` shows how to add an ```SPSkeletonEntity``` and an ```SPAnimatedEntity``` to the world. But, it is exactly the same as adding a normal entity is.

Libraries
=========

While I have included the Spine Starling & Spine AS3 runtimes, Starling and StarlingPunk itself these are all available independently and may be more up-to-date.

- Spine-AS3: https://github.com/EsotericSoftware/spine-runtimes/tree/master/spine-as3

- Spine-Starling: https://github.com/EsotericSoftware/spine-runtimes/tree/master/spine-starling

- Starling: https://github.com/PrimaryFeather/Starling-Framework

- StarlingPunk: https://github.com/asaia/StarlingPunk
