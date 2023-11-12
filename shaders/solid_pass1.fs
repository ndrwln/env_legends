
uniform sampler2D u_texSampler0;
uniform vec2 u_frameBufferSize;

varying vec4 v_vertexColor0;


void main()
{
	vec2 pixel = vec2(1.0 / u_frameBufferSize.x, 1.0 / u_frameBufferSize.y);
	vec2 tc;
	float a;

	tc = gl_FragCoord.xy;
	tc *= pixel;
	a = texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.x -= 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.x += 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y += 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y -= 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y -= 1;
	tc.x -= 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y += 1;
	tc.x += 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y -= 1;
	tc.x += 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	tc = gl_FragCoord.xy;
	tc.y += 1;
	tc.x -= 1;
	tc *= pixel;
	a += texture2D(u_texSampler0, tc).a;

	a = min(a * 0.1111111, 1.0);

	gl_FragColor.rgb = v_vertexColor0.rgb;
	gl_FragColor.a = a * v_vertexColor0.a;
}