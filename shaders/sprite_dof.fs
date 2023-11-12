
uniform sampler2D u_texSamplers[NUM_TEXTURE_SAMPLERS];
uniform vec4 u_ambientColor;
uniform float u_ambientSaturation;

varying vec4 v_vertexColor0;
varying vec4 v_vertexColor1;
varying vec2 v_texCoords0;
varying float v_texture0;
varying float v_factor;
varying float v_saturation0;
varying float v_DOFfactor;


void main()
{
	vec4 tex0;
	vec4 tex1;
	
	int texIndex0 = int(v_texture0);

	if(texIndex0 == 0)
	{
		tex0 = texture2D(u_texSamplers[0], v_texCoords0);
		tex1 = textureLod(u_texSamplers[0], v_texCoords0, 2);
	}

	else if(texIndex0 == 1)
	{
		tex0 = texture2D(u_texSamplers[1], v_texCoords0);
		tex1 = textureLod(u_texSamplers[1], v_texCoords0, 2);
	}

	else if(texIndex0 == 2)
	{
		tex0 = texture2D(u_texSamplers[2], v_texCoords0);
		tex1 = textureLod(u_texSamplers[2], v_texCoords0, 2);
	}

	else if(texIndex0 == 3)
	{
		tex0 = texture2D(u_texSamplers[3], v_texCoords0);
		tex1 = textureLod(u_texSamplers[3], v_texCoords0, 2);
	}

	else if(texIndex0 == 4)
	{
		tex0 = texture2D(u_texSamplers[4], v_texCoords0);
		tex1 = textureLod(u_texSamplers[4], v_texCoords0, 2);
	}

	else if(texIndex0 == 5)
	{
		tex0 = texture2D(u_texSamplers[5], v_texCoords0);
		tex1 = textureLod(u_texSamplers[5], v_texCoords0, 2);
	}

	else if(texIndex0 == 6)
	{
		tex0 = texture2D(u_texSamplers[6], v_texCoords0);
		tex1 = textureLod(u_texSamplers[6], v_texCoords0, 2);
	}

	else if(texIndex0 == 7)
	{
		tex0 = texture2D(u_texSamplers[7], v_texCoords0);
		tex1 = textureLod(u_texSamplers[7], v_texCoords0, 2);
	}

// 	else if(texIndex0 == 8)
// 	{
// 		tex0 = texture2D(u_texSamplers[8], v_texCoords0);
// 		tex1 = textureLod(u_texSamplers[8], v_texCoords0, 2);
// 	}
// 
// 	else if(texIndex0 == 9)
// 	{
// 		tex0 = texture2D(u_texSamplers[9], v_texCoords0);
// 		tex1 = textureLod(u_texSamplers[9], v_texCoords0, 2);
// 	}

	//vec4 col = v_vertexColor0 * (tex0 * v_factor + tex1 * (1.0 - v_factor));
	vec4 col = v_vertexColor0 * mix(tex1, tex0, v_DOFfactor);
	float saturation = v_saturation0 * u_ambientSaturation;

	if(saturation != 1.0)
	{
		float desaturatedColor = (1.0 - saturation) * (col.r + col.g + col.b) * 0.333333333;
		col.rgb = col.rgb * saturation + desaturatedColor;
	}
	
	if(v_factor != 0.0)
	{
		col.rgb = col.rgb * (1.0 - v_factor) + v_vertexColor1.rgb * v_factor;
	}

	gl_FragColor = u_ambientColor * col;
}