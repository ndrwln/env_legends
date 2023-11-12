
attribute vec2 a_texCoords0;
attribute int a_texture0;

uniform vec2 u_translation;
uniform vec3 u_scale;

varying vec2 v_texCoords0;
varying float v_texture0;


void main()
{
	// position
	gl_Position = a_position;
	
	// position
	gl_Position.xy -= u_translation.xy;
	gl_Position.xyz *= u_scale.xyz;

	// varyings
	v_texCoords0 = a_texCoords0;
	v_texture0 = float(a_texture0);
}