
uniform sampler2D u_texSamplers[NUM_TEXTURE_SAMPLERS];
uniform vec4 u_ambientColor;

varying vec2 v_texCoords0;
varying float v_texture0;


void main()
{
	vec4 texColor = texture2D(u_texSamplers[0], v_texCoords0);
	gl_FragColor =  texColor * u_ambientColor;
}