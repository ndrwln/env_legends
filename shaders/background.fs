
uniform sampler2D u_texSamplers[NUM_TEXTURE_SAMPLERS];
uniform vec4 u_ambientColor;

varying vec2 v_texCoords0;
varying float v_texture0;


void main()
{
	vec4 tex0 = texture2D(u_texSamplers[0], v_texCoords0);
 	vec4 tex1 = textureLod(u_texSamplers[0], v_texCoords0, 2);
 	vec4 col = mix(tex1, tex0, 0.5);
	
	//vec4 col = tex0;
	//vec4 col = mix(tex1, tex0, 0.6) * 0.4;	

	vec4 Sepia1 = vec4( 0.2, 0.05, 0.0, 1.0 );    
	vec4 Sepia2 = vec4( 1.0, 0.9, 0.5, 1.0 );
 
	float SepiaMix = dot(vec3(0.3, 0.59, 0.11), vec3(col));
	col = mix(col, vec4(SepiaMix), vec4(0.5));
	vec4 Sepia = mix(Sepia1, Sepia2, SepiaMix);
 
	gl_FragColor = mix(col, Sepia, 1.0) * 0.5;

	//gl_FragColor = col * u_ambientColor;
}