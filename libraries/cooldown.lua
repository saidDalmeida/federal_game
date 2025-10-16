function reload(t,crn,temp,ft,dt)
    if crn == true  then
        t = t + temp * dt
        print(t)

        if t >= ft then
            t = ft
        end
    end  

    if crn == false  then
        t = t - temp * dt
        print(t)

        if t <= ft then
            t = ft
        end
    end  

    return t
end