#pragma once

#include "Common.h"
#include "DDSTextureLoader11.h"

// --------------------------------------------------------------------------------
// Structures
// --------------------------------------------------------------------------------
struct SimpleVertex
{
	XMFLOAT3 Pos;
	XMFLOAT2 Material;
};

struct ConstantBuffer
{
	XMMATRIX World;
	XMMATRIX View;
	XMMATRIX Projection;
};

struct CBView
{
	XMMATRIX View;
};

struct CBProjection
{
	XMMATRIX Projection;
};

struct CBWorld
{
	XMMATRIX World;
};


HRESULT InitWindow(_In_ HINSTANCE hInstance, _In_ INT nCmdShow);
HRESULT InitDevice();

void CleanupDevice();
void Render();

HRESULT CompileShaderFromFile(_In_ PCWSTR pszFileName, _In_ PCSTR pszEntryPoint, _In_ PCSTR pszShaderModel, _Outptr_ ID3DBlob** ppBlobOut);

void HandleInput(FLOAT deltaTime);
void Update(FLOAT deltaTime);