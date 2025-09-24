module PCA9685

using PyCall

export ServoDriver, setthrottle!

"""
```julia
ServoDriver(i2c)
```
Create a ServoDriver object controlling a servo driver connected to the `i2c` bus
"""
struct ServoDriver
    kit #python library
    function ServoDriver(i2c)
        servokit = pyimport("adafruit_servokit").ServoKit
        kit = servokit(channels=16,i2c=i2c)
        new(kit)
    end
end

"""
```julia
setthrottle!(s,i,throttle)
```
Set the throttle on a continuous servo connected to channel `i` on a `ServoDriver`
"""
function setthrottle!(s::ServoDriver,i::Int,throttle::Real)
    #pycall will attempt to shift from 1 indexed arrays to 0 indexed, but all the
    #boards are labeled with 0 indexed addresses, so we need to throw an i+1 in here
    s.kit.continuous_servo[i+1].throttle = throttle
    return nothing
end

end # module PCA9685
