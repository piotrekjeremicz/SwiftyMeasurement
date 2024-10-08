## Description
### Core target
The Core target contains `class Measure` that is the main object used to measure a time interval between start and end of the measured block. `Measure` is a singleton that could be started via `Measure.the("Measurement name")` method.

The next step is to load a block of code that should be measured. There is a global function `measure("Block name") { }` that associate the closure with a measurement declared name.

Each block is repeated by default 100 000 times, what could be simple call as a zoom on a timeline. One time closure call will not reveal the time period that could be representative. Many of them will be much more clear to compare between different measurement.

The measure should be run by using `Measure.run()` method which have default attempts parameter set to 10 times. This value indicate the algorithm how many times the block repeated x times should be repeated. The result is summed up and divided by the number of approaches to get an average value.
