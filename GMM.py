import numpy as np
import matplotlib.pyplot as plt
import matplotlib.mlab as mlab
import matplotlib as mpl
from sklearn import mixture
from scipy import misc
from scipy import linalg
import itertools
R = 1
G = 2
B = 3
def fit_samples(samples):
    gmix = mixture.GaussianMixture(n_components=3, covariance_type='full', max_iter=200, n_init=6, init_params = 'kmeans' )
    gmix.fit(samples)
    print(gmix.means_)
    print(gmix.covariances_)
    colors = ['r' if i==1 else 'g' if i==2 else 'b' if i==3 else 'y' if i==4 else 'k'for i in gmix.predict(samples)]
    ax = plt.gca()
    ax.scatter(samples[:,0], samples[:,1], c=colors , alpha=0.6, marker='.',edgecolors = 'face')
    ax.scatter(gmix.means_[:,0],gmix.means_[:,1], c='black', alpha=1, marker='+')
    for i,(mean, covar)in enumerate(zip(gmix.means_,gmix.covariances_)):
        v, w = linalg.eigh(covar)
        v = 2. * np.sqrt(2.) * np.sqrt(v)
        u = w[0] / linalg.norm(w[0])
        if not np.any(gmix.predict(samples) == i):
            continue
        angle = np.arctan(u[1] / u[0])
        angle = 180. * angle / np.pi  # converting to degrees
        ell = mpl.patches.Ellipse(mean, 3*v[0], 3*v[1], 180. + angle, fill=False, color = 'black')
        ell.set_clip_box(ax.bbox)
        ell.set_alpha(0.5)
        ax.add_artist(ell)
    plt.savefig("colorclass.png")
    for i in range(3):
        greyScalePlot = []
        for pixel in gmix.predict_proba(samples):
            greyScale = int(255*pixel[i])
            greyScalePlot.append([greyScale,greyScale,greyScale])
        greyScalePlot = np.asarray(greyScalePlot)
        greyScalePlot = greyScalePlot.reshape(225,225,3)
        title='Greyscale'+str(i)+'.png'
        greyScalePlot = misc.toimage(greyScalePlot,cmin=0, cmax=255)
        misc.imsave(title, greyScalePlot)
        
img = misc.imread('TongueImage.jpg')
array = []
for pixelRow in img:
    for pixel in pixelRow:
        try:
            r = pixel[R]/(float(pixel[R])+pixel[G]+pixel[B])
        except ZeroDivisionError:
            r = 0
        try:
            g = pixel[G]/(float(pixel[R])+pixel[G]+pixel[B])
        except ZeroDivisionError:
            g = 0
        alpha = 255/(max([r,g,1-r-g]))
        pixel[R] = int(alpha*r)
        pixel[G] = int(alpha*g)
        pixel[B] = int(alpha*(1-r-g))
        array.append([r,g])

matrix = np.asarray(array)
fit_samples(array)
