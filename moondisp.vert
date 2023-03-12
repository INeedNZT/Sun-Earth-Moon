uniform float uScale;
uniform sampler2D uDispUnit;
out vec2 vST;
out vec3 vNormal;
void
main( )
{
	vec2 st = gl_MultiTexCoord0.st;
	vST = st; // to send to fragment shader
	vec3 norm = normalize( gl_Normal );
	vNormal= normalize( gl_NormalMatrix * gl_Normal );
	float disp = texture( uDispUnit, st ).r;
	// in half-meters, relative to a radius of 1,727,400 meters
	disp *= uScale;
	vec3 vert = gl_Vertex.xyz;
	vert += norm * disp;
	gl_Position = gl_ModelViewProjectionMatrix * vec4( vert, 1. );
}