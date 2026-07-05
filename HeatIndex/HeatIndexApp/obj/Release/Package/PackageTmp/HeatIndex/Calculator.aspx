<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="HeatIndexApp.HeatIndex.Calculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Heat Index Calculator</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background: linear-gradient(to right, #dbeafe, #e0f2fe);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card-custom {
            margin-top: 80px;
            padding: 30px;
            border-radius: 15px;
            background-color: #ffffff;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .title {
            color: #0d6efd;
            font-weight: 600;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-custom {
            background-color: #0d6efd;
            color: white;
            border-radius: 10px;
            padding: 10px 20px;
        }

        .btn-custom:hover {
            background-color: #0b5ed7;
        }

        .result-text {
            font-size: 18px;
            font-weight: 500;
            color: #0d6efd;
        }

        .error-text {
            color: red;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <div class="container d-flex justify-content-center">
        <div class="col-md-6">
            <form id="frmHeatIndexCalculator" runat="server" class="card-custom">

                <h2 class="text-center title">Heat Index Calculator</h2>
                <hr />

                <!-- Temperature -->
                <div class="mb-3">
                    <label class="form-label">Air Temperature</label>
                    <div class="d-flex gap-2">
                        <asp:TextBox ID="txtAirTemperature" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:DropDownList ID="listTemperatureType" CssClass="form-select" runat="server" style="max-width:100px;">
                            <asp:ListItem Value="1">°C</asp:ListItem>
                            <asp:ListItem Value="2" Selected="True">°F</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="error-text">
                        <asp:RegularExpressionValidator ID="valAirTemperatureNumeric" runat="server"
                            ControlToValidate="txtAirTemperature"
                            ErrorMessage="Enter a valid number"
                            ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic" />

                        <asp:RequiredFieldValidator ID="valAirTemperature" runat="server"
                            ControlToValidate="txtAirTemperature"
                            ErrorMessage="Required" Display="Dynamic" />
                    </div>
                </div>

                <!-- Humidity -->
                <div class="mb-3">
                    <label class="form-label">Relative Humidity (%)</label>

                    <asp:TextBox ID="txtRelativeHumidity" CssClass="form-control" runat="server"></asp:TextBox>

                    <div class="error-text">
                        <asp:RegularExpressionValidator ID="valRelativeHumidityNumeric" runat="server"
                            ControlToValidate="txtRelativeHumidity"
                            ErrorMessage="Enter a valid number"
                            ValidationExpression="^\d+$" Display="Dynamic" />

                        <asp:RequiredFieldValidator ID="valRelativeHumidity" runat="server"
                            ControlToValidate="txtRelativeHumidity"
                            ErrorMessage="Required" Display="Dynamic" />
                    </div>
                </div>

                <!-- Button -->
                <div class="text-center mt-4">
                    <asp:Button CssClass="btn btn-custom" ID="btnCalculate"
                        runat="server" Text="Calculate"
                        OnClick="btnCalculate_Click" />
                </div>

                <!-- Result -->
                <div class="text-center mt-4">
                    <asp:Label ID="lblResult" CssClass="result-text" runat="server"></asp:Label>
                </div>

            </form>
        </div>
    </div>
</body>
</html>