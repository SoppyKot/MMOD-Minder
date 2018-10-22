
P = imread('perfect2.bmp');
[m, n, p] = size(P);
D = imread('damaged2.bmp');

DamageMask = zeros(m, n);
DefectLoc = [0 0];
for row = 1:1:m
    for column = 1:1:n
        for colour = 1:1:p
            if (P(row, column, colour) ~= D(row, column, colour))
                DamageMask(row, column) = 255;
                DefectLoc = [DefectLoc; row column];
            end
        end
    end
end
[i, j] = size(DefectLoc);

subplot(2, 2, 1); imshow(P); title('Original Image');
subplot(2, 2, 2); imshow(D); title('Image showing damage');
subplot(2, 2, 3); imshow(DamageMask); title('Damage Mask');
subplot(2, 2, 4); imshow(D); title('Image with located defects'); hold on;

% this part of the code plots circles around the defect areas
theta = 0 : 0.01 : 2*pi;
radius = 20;
for k = 2 : i
	yCenter = DefectLoc(k ,1);
	xCenter = DefectLoc(k, 2);
	thisX = radius * cos(theta) + xCenter;
	thisY = radius * sin(theta) + yCenter;
	% Plot circles around the center
	plot(thisX, thisY, 'r', 'LineWidth', 0.01);
end