
#define DOF_STRENGTH 0.25

attribute vec4 a_vertexColor0;
attribute vec4 a_vertexColor1;
attribute vec2 a_texCoords0;
attribute int a_texture0;
attribute int a_level;
attribute float a_saturation0;
attribute float a_factor;

uniform vec2 u_translation;
uniform vec3 u_scale;
uniform int u_level;

varying vec4 v_vertexColor0;
varying vec4 v_vertexColor1;
varying vec2 v_texCoords0;
varying float v_texture0;
varying float v_factor;
varying float v_saturation0;
varying float v_DOFfactor;


void main()
{
    // position
	gl_Position = a_position;

	// position
	gl_Position.xy -= u_translation.xy;
	gl_Position.xyz *= u_scale.xyz;
    
	// varyings
    v_vertexColor0 = a_vertexColor0 / 255.0;
	v_vertexColor1 = a_vertexColor1 / 255.0;
	v_texCoords0 = a_texCoords0;
	v_texture0 = float(a_texture0);
	v_saturation0 = a_saturation0;
	v_factor = a_factor;

	v_DOFfactor = min(1.0, 1.0 - DOF_STRENGTH * max(0.0, float(u_level - a_level)));
}