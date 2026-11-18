# together
A hocketing script for Crow with four modes.

### <ins>Overview</ins>
together distributes the steps of a CV/gate sequence between two voices.  
It has four unique modes that determine how the sequence is distributed. 
#### Modes
1. Traditional - Each step alternates between the two voices.
2. Custom - Each voice plays an individually defined number of steps before switching.
3. Bernoulli - A defined probability determines which voice will play each incoming step.
4. Random - On each turn, each voice will play a random number of steps from a defined range.

### <ins>Setup</ins>  

Input 1: CV  
Input 2: Gate  
Output 1: Voice 1 CV  
Output 2: Voice 1 Gate  
Output 3: Voice 2 CV  
Output 4: Voice 2 Gate       

#### Switching Mode  
By default, The script starts up in traditional mode.   
Executing `modes()` in Druid will print a list of the available modes and the command for switching them, `mode[n]()`.
Alternatively, you can switch by calling a mode's function e.g `traditional()`.  
The current value of a mode's key parameters are printed when it's loaded.

#### Parameters

Key parameters that define how each mode functions can be found for editing at the top of the script.    
They have shortened names so they can also be easily redefined live using Druid.  
In custom and Bernoulli modes, live parameter changes take effect on the next incoming trigger.  
In random mode, new `min` or `max` bounds are applied after the current set of steps has finished playing. 
Live parameter changes in Druid persist between mode changes, but not power cycles.

|[n]|Mode|Parameters|Description|Default|
|---|---|---|---|---|
|1|Traditional|n/a|
|2|Custom|`s1`|The number of steps played by voice 1 before switching.|`1`|
|||`s2`|The number of steps played by voice 2 before switching.|`2`|
|3|Bernoulli|`prob`|The probability that voice 1 will play an incoming step.  Probability is represented by a decimal e.g. `0.7`=70%|`0.5`|
|4|Random|`min`|The lowest number of steps a voice can play.|`1`|
|||`max`|The highest number of steps a voice can play.|`5`|



