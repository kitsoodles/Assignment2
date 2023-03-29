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

