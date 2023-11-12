
attribute vec4 a_vertexColor0;

uniform vec2 u_translation;
uniform vec3 u_scale;

varying vec4 v_vertexColor0;


void main()
{
    // position
	gl_Position = a_position;

	// position
	gl_Position.xy -= u_translation.xy;
	gl_Position.xyz *= u_scale.xyz;
    
	// varyings
    v_vertexColor0 = a_vertexColor0 / 255.0;
}