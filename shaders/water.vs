
attribute vec2 a_texCoords0;
attribute float a_factor;

varying vec2 v_texCoords0;
varying float v_factor;


void main()
{
	// position
	gl_Position = a_position;

	// varyings
	v_texCoords0 = a_texCoords0;
	v_factor = a_factor;
}