function smoothlife ()
	NX = 256;
	NY = 256;
	ra = 14;
	ri = ra/3;
	b = 1;
	b1 = 0.278;
	b2 = 0.365;
	d1 = 0.267;
	d2 = 0.445;
	alphan = 0.028;
	alpham = 0.147;
    

	kd = zeros(NY,NX);
	kr = zeros(NY,NX);
	%aa = zeros(NY,NX);
	for iy = 1:NY
	for ix = 1:NX
		x = ix-1-NX/2;
		y = iy-1-NY/2;
		r = sqrt(x*x+y*y);
		kd(iy,ix) = 1-func_linear (r, ri, b);
		kr(iy,ix) = func_linear (r, ri, b)*(1-func_linear (r, ra, b));
		%aa(iy,ix) = snm (ix/NX, iy/NY, alphan, alpham, b1, b2, d1, d2);
	end
	end
	%figure; imagesc(aa);
	%figure; imagesc(kd);
	%figure; imagesc(kr);
	kflr = sum(sum(kr));
	kfld = sum(sum(kd));
	krf = fft2(fftshift(kr));
	kdf = fft2(fftshift(kd));
	%figure; imagesc(real(krf));
	%figure; imagesc(real(kdf));

	aa = initaa(NY,NX,ra);
    a = aa;
    cm = colour_scheme(60);
	%figure; imagesc(aa);
	for i = 1 : 800
		aaf = fft2(aa);
		nf = aaf.*krf;
		mf = aaf.*kdf;
		n = real(ifft2(nf))/kflr;
		%figure; imagesc(n);
		m = real(ifft2(mf))/kfld;
		%figure; imagesc(m);
		aa = snm (n, m, alphan, alpham, b1, b2, d1, d2);
        
        a = a + aa;
        a(a>11) = 5;
        a = a - 0.3;
        
% 		imagesc(aa); colormap(gray); caxis([0 1]); colorbar; pause (0.001);
        
        
        
    end
    
    colormap(cm)
    pcolor(a), shading interp
    axis equal off
    
end


function ret = func_linear (x, a, b)
	if x<a-b/2
		ret = 0;
	elseif x>a+b/2
		ret = 1;
	else
		ret = (x-a+b/2)/b;
	end
end

function ret = func_smooth (x, a, b)
	ret = 1./(1+exp(-(x-a)*4/b));
end

function ret = sigmoid_a (x, a, ea)
	ret = func_smooth (x, a, ea);
end

function ret = sigmoid_b (x, b, eb)
	ret = 1-sigmoid_a (x, b, eb);
end

function ret = sigmoid_ab (x, a, b, ea, eb)
	ret = sigmoid_a (x, a, ea).*sigmoid_b (x, b, eb);
end

function ret = sigmoid_mix (x, y, m, em)
	ret = x.*(1-func_smooth (m, 0.5, em)) + y.*func_smooth (m, 0.5, em);
end

function ret = snm (n, m, en, em, b1, b2, d1, d2)
	ret = sigmoid_ab (n, sigmoid_mix (b1, d1, m, em), sigmoid_mix (b2, d2, m, em), en, en);
end


function ret = splat (aa, ny, nx, ra)
	x = fix(rand*nx)+1;
	y = fix(rand*ny)+1;
	c = rand>0.5;

	for dx = -ra:ra
	for dy = -ra:ra
		ix = x+dx;
		iy = y+dy;
		if ix>=1 && ix<=nx && iy>=1 && iy<=ny
			aa(iy,ix) = c;
		end
	end
	end

	ret = aa;
end

function ret = initaa (ny, nx, ra)
	aa = zeros(ny,nx);
	for t = 0:((nx/ra)*(ny/ra))
		aa = splat (aa, ny, nx, ra);
	end
	ret = aa;
end