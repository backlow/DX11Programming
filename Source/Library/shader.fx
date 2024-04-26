/*
cbuffer ConstantBuffer : register(b0) // 컨스탄트 버퍼
{
	matrix World;
	matrix View;
	matrix Projection;
}8
*/
// 구조체 선언
// --------------------------------------------------------------------------------



cbuffer cbView : register(b0)
{
	matrix View;
};

cbuffer cbProjection : register(b1)
{
	matrix Projection;
};

cbuffer cbWorld : register(b2)
{
	matrix World;
};

struct VS_INPUT
{
	float4 Position : POSITION;
	float2 TexCoord : TEXCOORD0;
};

struct PS_INPUT
{
	float4 Position : SV_POSITION;
	float2 TexCoord : TEXCOORD0;
};

PS_INPUT VS(VS_INPUT input)
{
	PS_INPUT output = (PS_INPUT)0;

	output.Position = mul(input.Position, World);
	output.Position = mul(output.Position, View);
	output.Position = mul(output.Position, Projection);
	output.TexCoord = input.TexCoord;

	return output;
}





/*
struct VS_OUTPUT // 버텍스 세이더 아웃풋 구조체
{
	float4 Pos : SV_POSITION;
	float4 Color : COLOR0;
};

VS_OUTPUT VS(float4 Pos:POSITION, float4 Color : COLOR) // 버텍스 쉐이더 아웃풋
{
	VS_OUTPUT output = (VS_OUTPUT)0;
	output.Pos = mul(Pos, World);
	output.Pos = mul(output.Pos, View);
	output.Pos = mul(output.Pos, Projection);
	output.Color = Color;

	return output;
}


float4 PS(VS_OUTPUT input) : SV_Target  // VS 아웃풋이 PS로 들어감, PS에서 COLOR 부분만 출력
{
	return input.Color;
}
*/


Texture2D txDiffuse : register(t0);
SamplerState samLinear : register (s0);


float4 PS(PS_INPUT input) : SV_Target
{
	return txDiffuse.Sample(samLinear, input.TexCoord);
}