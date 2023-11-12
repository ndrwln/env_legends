
attribute vec2 a_texCoords0;
attribute int a_texture0;

varying vec2 v_texCoords0;
varying float v_texture0;


void main()
{
	// position
	gl_Position = a_position;

	// varyings
	v_texCoords0 = a_texCoords0;
	v_texture0 = float(a_texture0);
}