# Assignment2
1.![image](https://user-images.githubusercontent.com/98484257/228286682-93e6cad2-8717-4f48-9c9d-29d3cccf6233.png)
empty scene made
added to repository 
![image](https://user-images.githubusercontent.com/98484257/228289187-d3f3f76d-0d37-4cb6-a886-5176245441ae.png)

the difference between deferred and forward rendering is how shaders are applied. In forward rendering, each instance of lighting is rendered separately then added on top of one another. Deferred rendering however works by creating the mesh first, then using a buffer renders all the this makesighting/shader effects on the geometry. 

this is a simple flow chart showing how forward rendering works, the object is calculated separately with each instance of lighting and then added at the end

![image](https://user-images.githubusercontent.com/98484257/228292165-773d9d0c-c935-4927-ae5d-b606e82aaf3c.png)

meanwhile, deferred rendering renders the object first, then adds the lighting through a buffer and adds them all at once. 

![image](https://user-images.githubusercontent.com/98484257/228292761-e92831ce-5919-4db3-8861-ffe047e38dff.png)

this allows optimal performance as well as avoiding shader errors

![image](https://user-images.githubusercontent.com/98484257/228589192-488d4ea2-d959-4b7e-9de3-0b99bfe0f2e2.png)

Here, I implimented square waves along with a toon shader on these waves. To achieve this, I took the triangular wave and set it to have a height of +1 whenever the number produced by _WaveHeight was greater than or equal to zero, and set to -1 whenever it's less than zero. This way, the wave will form a square pattern instead of a triangular one, at least in theory. For some reason, this occasionally produces the correct square waves while also producing some triangular waves at random. My theory is that the if statements aren't able to keep up with the calculation above it, thus only producing the intended effect on some iterations of the waves. Nonetheless, I do believe my approach to be correct. 

The way that this differs from the regular toon shading code is that it had to be combined with the wave code so that both may exist at the same time without affecting the actual waves themselves. This provides both the movement as well as the toon shader. 



The code provided is for mipmapping a texture to either increase or decrease it's quality. The following line:
for (; i < iterations; i++) { 
width /= 2; 
height /= 2; 
currentDestination = textures[i] = 
RenderTexture.GetTemporary(width, height, 0,  
format); 
if (height < 2) { 
break; 
} 
currentDestination = 
RenderTexture.GetTemporary(width, height, 0,  
format); 

takes the texture and downsamples it to make ti smaller, but can also be used to upscale it to make it larger if needed. Then, the texture is iterated as many times as necessary to maintain the size of the original image even after the scaling 

for (; i < iterations; i++) { 
Graphics.Blit(currentSource,  
currentDestination); 


This code can be used as mentioned to either upscale or downscale a texture without losing quality so that a small texture can cover a large amount of space without deteriorating, or to use a large texture on a smaller area at a higher quality.


![image](https://user-images.githubusercontent.com/98484257/228594673-b298c84c-a04a-480d-a869-e17f2695fc5a.png)

Here, I added a toon shader, a diffuse shader, and an outline effect to the shark object. First, there's the standard toon shader but instead of just toon shading, this also adds a standard diffuse effect. This way, you can have a mix of soft and hard shadows creating a unique multi media drawn effect, like it was shaded in both graphite as well as marker. The way that this was achieved was by using the standard toon shading effect, but also adding the functionality for diffuse as well. So there's both the step shading effect where it only takes certain levels of light and assigns them colours based on the texture given, but also adds a normal shadow pass using diffuse shading. The outline effect makes a larger iteration of the model outside on a transparent layer giving it an outlined effect without covering up the actual model itself. 

