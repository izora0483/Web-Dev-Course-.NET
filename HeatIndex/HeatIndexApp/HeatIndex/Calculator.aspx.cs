using System;
using System.Net.Http;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HeatIndexApp.HeatIndex
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        // This method is used to make the API call
        private async Task<string> CallHeatIndexApiAsync(double temperature, double humidity)
        {
            using (var client = new HttpClient())
            {
                try
                {
                    string apiUrl = $"http://e0710483.elmcsis.com/api/heatindexapi?temperature={temperature}&humidity={humidity}";
                    var response = await client.GetStringAsync(apiUrl);
                    return response;
                }
                catch (Exception ex)
                {
                    return $"Error: {ex.Message}";
                }
            }
        }

        protected async void btnCalculate_Click(object sender, EventArgs e)
        {

            double temperature = Convert.ToDouble(txtAirTemperature.Text);
            double humidity = Convert.ToDouble(txtRelativeHumidity.Text);

            // This converts the Celsius input to Fahrenheit
            if (listTemperatureType.SelectedValue == "1")
            {
                temperature = (temperature * 9.0 / 5.0) + 32;
            }

            string Results = await CallHeatIndexApiAsync(temperature, humidity);

            lblResult.Text = $"The heat index is: {Results} °F";
        }
    }
}