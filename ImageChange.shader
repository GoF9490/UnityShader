Shader "Blue/FifthShader"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white" {}
        _MainTex2("Texture2", 2D) = "white" {}
        _GS ("Change", Range(0,1)) = 0
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        sampler2D _MainTex2;
        float _GS;

        struct Input {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf(Input IN, inout SurfaceOutputStandard o) {
            float4 MainTex = tex2D(_MainTex, IN.uv_MainTex);
            float4 MainTex2 = tex2D(_MainTex2, IN.uv_MainTex2);

            o.Emission = lerp(MainTex, MainTex2, _GS);
            //o.Emission = lerp(MainTex, (MainTex.r + MainTex.g + MainTex.b)/3 , _GS);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
