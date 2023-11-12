
attribute vec2 a_texCoords0;
attribute vec2 a_texCoords1;
attribute float a_factor;

varying vec2 v_texCoords0;
varying vec2 v_texCoords1;
varying float v_factor;


void main()
{
	// position
	gl_Position = a_position;

	// varyings
	v_texCoords0 = a_texCoords0;
	v_texCoords1 = a_texCoords1;
	v_factor = a_factor;
}