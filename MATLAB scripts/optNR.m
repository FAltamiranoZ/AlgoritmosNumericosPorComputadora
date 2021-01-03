function [x, i, min] = optNR(f, x)
    TOL = eps;
    MAX = 100;
    i = 0;
    
    fsym = sym(f);
    dfsym = diff(fsym);
    df = matlabFunction (dfsym);
    
    fsym2 = sym(f);
    dfsym2 = diff(fsym2);
    df2 = matlabFunction (dfsym2);

    cond = true;
    while cond
        xp = x;
        x = xp - (df(xp)/df2(xp));
        i = i+1;
        cond = (abs((x-xp)/x))> TOL && df(x) ~=0 && i <=MAX;
    end
    
%     if (df (xp) > df(x))
%         min = true;
%     end %%Esta mal escrito (deberia de ser df2) y podia hacerse mas
%     facil.

    min = (df2(x) > 0);
    
end