# together
A two-voice hocket for Crow with four modes


### <ins>Overview</ins>
Together distributes a CV/gate sequence between two voices.  
It has four unique modes that determine how the sequence is distributed. 
#### Modes
1. Traditional - Each step alternates between the two voices.
2. Custom - Each voice plays an individually defined number of steps before switching.
3. Boolean - A defined probability determines which voice will play each incoming step.
4. Random - On each turn, each voice will play a random number of steps from a defined range.

### <ins>Setup</ins>  

Input 1: CV  
Input 2: Gate  
Output 1: Voice 1 CV  
Output 2: Voice 1 Gate  
Output 3: Voice 2 CV  
Output 4: Voice 2 Gate       

#### Changing Mode  
The script starts by default in traditional mode.   
Executing `modes()` in druid will print a list of the modes and the command for changing mode.  
The command for changing modes is `mode[n]()`.  
The key parameters for a given mode are printed when its loaded.        


#### Parameters

Key parameters that define how the modes function can be found at the top of the script.  
Edit the .lua to create your own init patch.  
They also have short names so they can  easily be redefined using druid.  
Live parameter changes in druid persist between mode changes but not power cycles.      

|[n]|Mode|Parameters|Description|Default|
|---|---|---|---|---|
|1|traditional|n/a|
|2|custom|`s1`|the number of steps played by voice 1 before switching|`1`|
|||`s2`|the number of steps played by voice 2 before switching|`2`|
|3|boolean|`prob`|the probability that voice 1 will play an incoming note.  The percentage of probability is represented by a decimal e.g. 0.7=70%|`0.5`|
|4|random|`min`|The lowest number of steps a voice can play|`1`|
|||`max`|The highest number of steps a voice can play|`5`|



