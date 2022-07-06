Shader "Blue/SixthShader"
{
    Properties
    {
        _Red("Red", Range(0,1)) = 0
        _Green("Green", Range(0,1)) = 0
        _Blue("Blue", Range(0,1)) = 0
        _Bright("Brightness", Range(-1,1)) = 0
    }

    SubShader
    {

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        struct Input {
            float4 color : COLOR;
        };
        
        float _Red;
        float _Green;
        float _Blue;
        float _Bright;

        void surf(Input IN, inout SurfaceOutputStandard o) {

            o.Albedo = float3(_Red, _Green, _Blue) + _Bright;
            o.Alpha = 1;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
