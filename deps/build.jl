using Conda
Conda.pip_interop(true)
Conda.pip("install",["adafruit-circuitpython-pca9685",
                     "adafruit-circuitpython-servokit"])
