using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HeatIndexApi.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class HeatIndexApi : ControllerBase
    {
        [HttpGet]
        public IActionResult GetHeatIndex([FromQuery] double temperature, [FromQuery] double humidity)
        {
            double T = temperature;
            double R = humidity;

            // Coefficients for the heat index equation
            double c1 = -42.379;
            double c2 = 2.04901523;
            double c3 = 10.14333127;
            double c4 = -0.22475541;
            double c5 = -0.00683783;
            double c6 = -0.05481717;
            double c7 = 0.00122874;
            double c8 = 0.00085282;
            double c9 = -0.00000199;

            // Heat Index formula
            double heatIndex = Math.Round(c1 +
                               c2 * T +
                               c3 * R +
                               c4 * T * R +
                               c5 * T * T +
                               c6 * R * R +
                               c7 * T * T * R +
                               c8 * T * R * R +
                               c9 * T * T * R * R);

            return Ok($"{heatIndex}");
        }
    }
}
