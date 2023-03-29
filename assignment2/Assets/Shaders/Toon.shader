Shader "Custom/Toon"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _OutlineColor("OutlineColor", Color) = (0, 0, 0, 1)
        _OutlineSize("OutlineSize", Range(1, 5)) = 1
        [Toggle] _ShowOutline("Show Outline?", Float) = 1

        _MainTex("Diffuse", 2D) = "white" {}
        _RampTex("Ramp Texture", 2D) = "white"{}
    }
    SubShader
    {
					Tags
			{
				"Queue" = "Transparent"
			}
			LOD 200

		// Outline Pass
		Pass
		{
			Stencil
			{
			Ref 1
			Comp Always
			}

			Cull Off
			ZWrite Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			float _OutlineSize;
			float4 _OutlineColor;
			float _ShowOutline;

			struct appdata
			{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float4 pos : POSITION;
				float4 color : COLOR;
				float3 normal : NORMAL;
			};

			v2f vert(appdata v)
			{
				v.vertex.xyz *= (_OutlineSize)*_ShowOutline;
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.color = _OutlineColor;
				return o;
			}

			half4 frag(v2f i) : COLOR
			{
				return _OutlineColor;
			}

			ENDCG
		}
        CGPROGRAM
        #pragma surface surf ToonRamp

        sampler2D _MainTex;
        sampler2D _RampTex;
        bool _ShowOutline;

       struct Input
       {
           float2 uv_MainTex;
           float3 vertColor;
       };

       float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed atten)
       {
           float diff = (dot(s.Normal, lightDir) * 0.5 + 0.5) * atten;
           float2 rh = diff;
           float3 ramp = tex2D(_RampTex, rh).rgb;

           float4 c;
           c.rgb = s.Albedo * _LightColor0.rgb * (ramp);
           c.a = s.Alpha;
           return c;
       }


       void surf(Input IN, inout SurfaceOutput o)
       {
           float4 c = tex2D(_MainTex, IN.uv_MainTex);
           o.Albedo = c.rgb * IN.vertColor.rgb;
           o.Alpha = c.a;
           o.Normal = float3(0, 0, 1);
       }
        ENDCG
    }
    FallBack "Diffuse"
}
