
uniform sampler2D u_texSamplers[NUM_TEXTURE_SAMPLERS];
uniform vec4 u_ambientColor;

varying vec2 v_texCoords0;
varying vec2 v_texCoords1;
varying float v_factor;


void main()
{
	vec4 texColor1 = texture2D(u_texSamplers[0], v_texCoords0 + vec2(v_factor * 1.0, v_factor * -0.25));
 	vec4 texColor2 = texture2D(u_texSamplers[0], (v_texCoords0 + vec2(v_factor * 0.5, v_factor * 1.5)) * 0.33);
 	vec4 texColor3 = texture2D(u_texSamplers[0], (v_texCoords0 + vec2(v_factor * 1.25, v_factor * 0.9)) * 1.75);

	gl_FragColor.rgb = (texColor1.rgb * 0.33 + texColor2.rgb * 0.33 + texColor3.rgb * 0.33) * u_ambientColor.rgb;

	gl_FragColor.a = texture2D(u_texSamplers[1], v_texCoords1).a;
}