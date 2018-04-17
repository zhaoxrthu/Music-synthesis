function y=envelope(t)
if t < 1/40
      y = t * 40;
    elseif t < 3/80
         y= 1.8-t*32;
else
      y = 0.6*exp((3-80*t)/50);
end

