
uniform vec4 u_ambientColor;

varying vec4 v_vertexColor0;


void main()
{
	gl_FragColor = v_vertexColor0 * u_ambientColor;
}