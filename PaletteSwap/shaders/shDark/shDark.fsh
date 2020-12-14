//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) * 0.4;
	gl_FragColor = vec4(0.0,0.0,0.0,gl_FragColor.a);
}
