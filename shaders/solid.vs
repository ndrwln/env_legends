
attribute vec4 a_vertexColor0;
attribute vec3 a_rotation;

uniform vec2 u_translation;
uniform vec3 u_scale;

varying vec4 v_vertexColor0;


void main()
{
    // position
	gl_Position = a_position;

	// rotation?
	if(a_rotation.z != 0.0)
	{
		float angle = (360.0 - a_rotation.z) * 0.01745329251994329;
		float c = cos(angle);
		float s = sin(angle);
		gl_Position.xy -= a_rotation.xy;
		float X = gl_Position.x * c - gl_Position.y * s;
		float Y = gl_Position.x * s + gl_Position.y * c;
		gl_Position.x = X + a_rotation.x;
		gl_Position.y = Y + a_rotation.y;
	}

	// position
	gl_Position.xy -= u_translation.xy;
	gl_Position.xyz *= u_scale.xyz;
    
	// varyings
    v_vertexColor0 = a_vertexColor0 / 255.0;
}