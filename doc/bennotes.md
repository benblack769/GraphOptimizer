# Strategy for infinite propagation of events through time.

### Main example

Input comes in through external sensors, including various objective functions.

Short term time series (STTS) engine predicts next input.

Decision engine makes a choice. The STTS engine predicts next input based on combination of choice + current input. If objective functions are not activated, then process terminates with no learning. If objective functions are activated with high value, then the choice backpropogates on the decision engine with (predicted next input) as its input, and then terminates. If objective function are activated with moderate values, then the simulation continues.

The true objective functions are a simple function of the original inputs. If they are triggered, then 

### Details on decision engine

Choices can be thought of as physical actions. Like bending your knee.

There may be various levels of decision engines. The first one may be the basic, primary scopes of ability of your body. A precise level of bending your knee. Higher levels may look like kicking a ball. A single higher level choice signaling a chain of choices, each of which gets put into the physics simulation engine, and gets output.

### Details on memory matrix

The memory matrix is more like a database than a neural network.

### Detail on Short term time series engine

It is basically a physics simulation engine.

Operates via standard LSTM or some other short term memory decay model.

Takes input only from real input, to avoid excessive recurrence of input and output.

Objective function is on accuracy of next observation. If low accuracy prediction, do not learn very much from that, so that confused or disorienting observations do not kill any operating model.

One nice thing about this is that it can be entirely trained separately from the rest of the cognition.
