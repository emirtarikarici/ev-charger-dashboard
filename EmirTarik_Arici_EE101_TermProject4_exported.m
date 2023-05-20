classdef EmirTarik_Arici_EE101_TermProject4_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        GridLayout                  matlab.ui.container.GridLayout
        EditField_2                 matlab.ui.control.EditField
        DropDown                    matlab.ui.control.DropDown
        PossibleStateofChargeLabel  matlab.ui.control.Label
        StationsEditField           matlab.ui.control.NumericEditField
        StationsEditFieldLabel      matlab.ui.control.Label
        VehiclesEditField           matlab.ui.control.NumericEditField
        VehiclesEditFieldLabel      matlab.ui.control.Label
        NameField                   matlab.ui.control.EditField
        SaveButton                  matlab.ui.control.Button
        RefreshDataButton           matlab.ui.control.Button
        EditField                   matlab.ui.control.EditField
        TabGroup                    matlab.ui.container.TabGroup
        NumberofCarsTab             matlab.ui.container.Tab
        GridLayout5                 matlab.ui.container.GridLayout
        BrandsoftheVehiclesLabel    matlab.ui.control.Label
        Brands                      matlab.ui.control.TextArea
        NumberOfCarsAxes            matlab.ui.control.UIAxes
        TimeofArrivalDepartureTab   matlab.ui.container.Tab
        GridLayout2                 matlab.ui.container.GridLayout
        DepartureAxes               matlab.ui.control.UIAxes
        ArrivalAxes                 matlab.ui.control.UIAxes
        StateofChargeTab            matlab.ui.container.Tab
        GridLayout4                 matlab.ui.container.GridLayout
        StateOfChargeAxes           matlab.ui.control.UIAxes
        EstimatedRevenueTab         matlab.ui.container.Tab
        GridLayout6                 matlab.ui.container.GridLayout
        Data2                       matlab.ui.control.NumericEditField
        Data1                       matlab.ui.control.NumericEditField
        PropertiesofStationLabel    matlab.ui.control.Label
        StationModel                matlab.ui.control.TextArea
        NumberofpossiblecustomershaveelectricvehicleLabel  matlab.ui.control.Label
        NumberofcustomerswantstogetchargedatthesametimeLabel  matlab.ui.control.Label
        EstRevAxes                  matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        dataTable % Description
        Vehicles % Description
        SOCs % Description
        ChargeDecisionData % Description
        ArrivalTime % Description
        DepartureTime % Description
        ChargeDuration % Description
        BatteryCapacity % Description
        NeedDuration = rand() % Description
        VehicleIn % Description
        DateTimeStr = "" % Description
        Revenue % Description
    end
    
    methods (Access = private)
        
        
        function results = brandName(app)
            for i = 1:app.VehiclesEditField.Value
                value = rand();
                if value <= 0.4
                    x(i) = 1;
                    y(i) = 98;
                elseif value <= 0.7
                    x(i) = 2;
                    y(i) = 71;
                elseif value <= 0.9
                    x(i) = 3;
                    y(i) = 64;
                elseif value > 0.9
                    x(i) = 4;
                    y(i) = 93;
                end
            end
            app.Vehicles = x';
            app.BatteryCapacity = y';
            results = x';
            histogram(app.NumberOfCarsAxes,x');
        end
        
        function results = timeOfArrivalandDeparture(app)
            for i = 1:app.VehiclesEditField.Value
                arrival = betarnd(0.75,0.75);
                min = randi([10 59])/ 100;
                timeSpend = randi([1 5]);
                minSpend = randi([10 59])/ 100;
                if arrival <= 0.1
                    x(i) = 8 + min;
                    y(i) = 8 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.2
                    x(i) = 9 + min;
                    y(i) = 9 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.3
                    x(i) = 10 + min;
                    y(i) = 10 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.4
                    x(i) = 11 + min;
                    y(i) = 11 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.5
                    x(i) = 12 + min;
                    y(i) = 12 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.6
                    x(i) = 13 + min;
                    y(i) = 13 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.7
                    x(i) = 14 + min;
                    y(i) = 14 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.8
                    x(i) = 15 + min;
                    y(i) = 15 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival <= 0.9
                    x(i) = 16 + min;
                    y(i) = 16 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                elseif arrival > 0.9
                    x(i) = 17 + min;
                    y(i) = 17 + timeSpend + minSpend;
                    z(i) = timeSpend + minSpend - 0.05;
                end
                results = [x' y' z'];
                app.ArrivalTime = x';
                app.DepartureTime = y';
                app.ChargeDuration = z';
                histogram(app.ArrivalAxes,x',10);
                histogram(app.DepartureAxes,y',10);
            end
        end
        
        function results = StateOfCharge(app)
            SOC = app.DropDown.Value;
            a = 1;
            b = 1;
            x = 0:0.1:1;
            if SOC == "20%"
                a = 1;
                b = 6;
            elseif SOC == "30%"
                a = 2;
                b = 6;
            elseif SOC == "40%"
                a = 3;
                b = 6;
            elseif SOC == "50%"
                a = 4;
                b = 6;
            elseif SOC == "60%"
                a = 5;
                b = 6;
            elseif SOC == "70%"
                a = 6;
                b = 6;
            elseif SOC == "80%"
                a = 7;
                b = 6;
            end
            for i=1: app.VehiclesEditField.Value
                x(i) = round(betarnd(a,b)*100);
            end
            app.SOCs = x';
            results = x';
            histogram(app.StateOfChargeAxes,x,10);
            app.StateOfChargeAxes.XLim = [0,100];
        end
        
        function results = ChargeDecision(app)
            for i=1:app.VehiclesEditField.Value
                value = rand();
                if value <= 0.5
                    x(i) = 0;
                else
                    x(i) = 1;
                end
            end
            results = x';
            numberOfCharge = sum(x(:) == 1);
            app.Data2.Value = numberOfCharge;
        end
        
        function results = CountVehicles(app)
            arrival = app.ArrivalTime;
            departure = app.DepartureTime;
            a = zeros(2,app.VehiclesEditField.Value);
            for i = 1:app.VehiclesEditField.Value
                a(1,(i * 2) - 1) = arrival(i);
                a(2,(i * 2) - 1 ) = 1;
                a(1,(i * 2)) = departure(i);
                a(2,(i * 2)) = 0;
            end
            a = sortrows(a.',1).';
            current = 0;
            max = 0;
            X = app.VehiclesEditField.Value * 2;
            for i = i:X
                if a(2,i) == 1
                    current = current + 1;
                else
                    if current > max
                        max = current;
                    end
                    current = current - 1;
                end
               results = max;
               app.VehicleIn = max;
               app.Data1.Value = max;
            end
        end
        
        function results = DurationCalculation(app)
            stationPower = 100;
            for i = 1:app.VehiclesEditField.Value
                a = app.BatteryCapacity(i) - ((app.SOCs(i) * app.BatteryCapacity(i)) / 100);
                b = fix(a / stationPower) * 60;
                c = abs((a / stationPower) - b) * 60;
                chardur(i) = b + c;
            end
            results = mean(chardur);
            app.NeedDuration = mean(chardur);
        end

        function results = makeDataTable(app)
            data = array2table(app.ChargeDecisionData',"VariableNames",{});
            data.("Brand ID") = app.Vehicles;
            data.("Empty Battery Capacity (kWh)") = app.BatteryCapacity;
            data.("State of Charge (%)") = app.SOCs;
            data.("Charge Duration (h)") = app.ChargeDuration;
            data.("Time of Arrival") = app.ArrivalTime;
            data.("Time of Departure") = app.DepartureTime;
            
            app.dataTable = data;
        end
        
        function results = EstimateRevenue(app)
            stations = 1:app.StationsEditField.Value * 2;
            rev = zeros(size(stations));
            rev(1) = app.NeedDuration * 7;
            for i = 2:app.StationsEditField.Value * 2
                if app.VehicleIn > stations(i)
                    rev(i) = (app.NeedDuration * 7) +rev(i-1);
                else
                    rev(i) = rev(i-1);
                end
            end
            results = rev;
            app.Revenue = rev;
            plot(app.EstRevAxes,rev);
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: RefreshDataButton
        function RefreshDataButtonPushed(app, event)
            brandName(app);
            StateOfCharge(app);
            timeOfArrivalandDeparture(app);
            ChargeDecision(app);
            makeDataTable(app);
            CountVehicles(app);
            DurationCalculation(app);
            EstimateRevenue(app);

            i = datestr(datetime("now","Format","dd/MM/uuuu HH:mm:ss"));
            i = strrep(i," ","_");
            app.DateTimeStr = strrep(i,":","-");
        end

        % Button pushed function: SaveButton
        function SaveButtonPushed(app, event)
            [fileName, pathName] = uiputfile("EE101_TermProject04.xlsx");
            fileName = strrep(fileName,".xlsx","_");
            if isequal(fileName,0) || isequal(pathName,0)
                disp("File didn't save. Please try again")
            else
                n = append(fileName,app.DateTimeStr,".xlsx");
                fileName = fullfile(pathName,n);
                writetable(app.dataTable,fileName);
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0.149 0.149 0.149];
            app.UIFigure.Position = [100 100 735 537];
            app.UIFigure.Name = 'MATLAB App';

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {'1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.RowHeight = {25, 25, '1x', '1x', '1x', '1x', '1x', '1x', '1x'};
            app.GridLayout.BackgroundColor = [0 0 0];

            % Create TabGroup
            app.TabGroup = uitabgroup(app.GridLayout);
            app.TabGroup.Layout.Row = [3 8];
            app.TabGroup.Layout.Column = [1 7];

            % Create NumberofCarsTab
            app.NumberofCarsTab = uitab(app.TabGroup);
            app.NumberofCarsTab.Title = 'Number of Cars';

            % Create GridLayout5
            app.GridLayout5 = uigridlayout(app.NumberofCarsTab);
            app.GridLayout5.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout5.RowHeight = {'1x', '1x', '1x', '1x', '1x'};
            app.GridLayout5.BackgroundColor = [1 1 1];

            % Create NumberOfCarsAxes
            app.NumberOfCarsAxes = uiaxes(app.GridLayout5);
            title(app.NumberOfCarsAxes, 'Number of Cars')
            xlabel(app.NumberOfCarsAxes, 'Brand ID')
            ylabel(app.NumberOfCarsAxes, '#')
            zlabel(app.NumberOfCarsAxes, 'Z')
            app.NumberOfCarsAxes.Layout.Row = [1 5];
            app.NumberOfCarsAxes.Layout.Column = [1 2];

            % Create Brands
            app.Brands = uitextarea(app.GridLayout5);
            app.Brands.FontSize = 16;
            app.Brands.Layout.Row = [2 3];
            app.Brands.Layout.Column = 3;
            app.Brands.Value = {'1.#  Tesla Model S'; '2.# BMW i8 '; '3.# Hyundai Kona'; '4.# Porsche Taycan'};

            % Create BrandsoftheVehiclesLabel
            app.BrandsoftheVehiclesLabel = uilabel(app.GridLayout5);
            app.BrandsoftheVehiclesLabel.HorizontalAlignment = 'center';
            app.BrandsoftheVehiclesLabel.FontSize = 16;
            app.BrandsoftheVehiclesLabel.FontWeight = 'bold';
            app.BrandsoftheVehiclesLabel.Layout.Row = 1;
            app.BrandsoftheVehiclesLabel.Layout.Column = 3;
            app.BrandsoftheVehiclesLabel.Text = 'Brands of the Vehicles';

            % Create TimeofArrivalDepartureTab
            app.TimeofArrivalDepartureTab = uitab(app.TabGroup);
            app.TimeofArrivalDepartureTab.Title = 'Time of Arrival/Departure';

            % Create GridLayout2
            app.GridLayout2 = uigridlayout(app.TimeofArrivalDepartureTab);
            app.GridLayout2.RowHeight = {'1x', '1x', '1x', '1x', '1x'};
            app.GridLayout2.BackgroundColor = [1 1 1];

            % Create ArrivalAxes
            app.ArrivalAxes = uiaxes(app.GridLayout2);
            title(app.ArrivalAxes, 'Arrival')
            xlabel(app.ArrivalAxes, 'Time of Arrival (h)')
            ylabel(app.ArrivalAxes, 'Number of Vehicles')
            zlabel(app.ArrivalAxes, 'Z')
            app.ArrivalAxes.Layout.Row = [1 5];
            app.ArrivalAxes.Layout.Column = 1;

            % Create DepartureAxes
            app.DepartureAxes = uiaxes(app.GridLayout2);
            title(app.DepartureAxes, 'Departure')
            xlabel(app.DepartureAxes, 'Time of Arrival (h)')
            ylabel(app.DepartureAxes, 'Number of Vehicles')
            zlabel(app.DepartureAxes, 'Z')
            app.DepartureAxes.Layout.Row = [1 5];
            app.DepartureAxes.Layout.Column = 2;

            % Create StateofChargeTab
            app.StateofChargeTab = uitab(app.TabGroup);
            app.StateofChargeTab.Title = 'State of Charge';

            % Create GridLayout4
            app.GridLayout4 = uigridlayout(app.StateofChargeTab);
            app.GridLayout4.ColumnWidth = {'1x', '1x', '1x'};
            app.GridLayout4.RowHeight = {'1x', '1x', '1x', '1x', '1x'};
            app.GridLayout4.BackgroundColor = [1 1 1];

            % Create StateOfChargeAxes
            app.StateOfChargeAxes = uiaxes(app.GridLayout4);
            title(app.StateOfChargeAxes, 'State of Charges of the Vehicles')
            xlabel(app.StateOfChargeAxes, 'Cars')
            ylabel(app.StateOfChargeAxes, 'Number of Cars')
            zlabel(app.StateOfChargeAxes, 'Z')
            app.StateOfChargeAxes.Layout.Row = [1 5];
            app.StateOfChargeAxes.Layout.Column = [1 3];

            % Create EstimatedRevenueTab
            app.EstimatedRevenueTab = uitab(app.TabGroup);
            app.EstimatedRevenueTab.Title = 'Estimated Revenue';

            % Create GridLayout6
            app.GridLayout6 = uigridlayout(app.EstimatedRevenueTab);
            app.GridLayout6.ColumnWidth = {'1x', '1x', 80, 163};
            app.GridLayout6.RowHeight = {'1x', '1x', '1x', '1x', '1x', 25, 25};
            app.GridLayout6.BackgroundColor = [1 1 1];

            % Create EstRevAxes
            app.EstRevAxes = uiaxes(app.GridLayout6);
            title(app.EstRevAxes, 'Estimated Revenue by Charging Stations')
            xlabel(app.EstRevAxes, 'Number of Sockets')
            ylabel(app.EstRevAxes, 'Daily Revenue')
            zlabel(app.EstRevAxes, 'Z')
            app.EstRevAxes.Layout.Row = [1 5];
            app.EstRevAxes.Layout.Column = [1 3];

            % Create NumberofcustomerswantstogetchargedatthesametimeLabel
            app.NumberofcustomerswantstogetchargedatthesametimeLabel = uilabel(app.GridLayout6);
            app.NumberofcustomerswantstogetchargedatthesametimeLabel.Layout.Row = 6;
            app.NumberofcustomerswantstogetchargedatthesametimeLabel.Layout.Column = [1 2];
            app.NumberofcustomerswantstogetchargedatthesametimeLabel.Text = 'Number of customers wants to get charged at the same time';

            % Create NumberofpossiblecustomershaveelectricvehicleLabel
            app.NumberofpossiblecustomershaveelectricvehicleLabel = uilabel(app.GridLayout6);
            app.NumberofpossiblecustomershaveelectricvehicleLabel.Layout.Row = 7;
            app.NumberofpossiblecustomershaveelectricvehicleLabel.Layout.Column = [1 2];
            app.NumberofpossiblecustomershaveelectricvehicleLabel.Text = 'Number of possible customers have electric vehicle';

            % Create StationModel
            app.StationModel = uitextarea(app.GridLayout6);
            app.StationModel.FontSize = 16;
            app.StationModel.Layout.Row = [2 5];
            app.StationModel.Layout.Column = 4;
            app.StationModel.Value = {'Model: ZES DC CCS 100kW'; 'Number of Sockets: 2'; 'Charging Price per minute: 7₺'};

            % Create PropertiesofStationLabel
            app.PropertiesofStationLabel = uilabel(app.GridLayout6);
            app.PropertiesofStationLabel.HorizontalAlignment = 'center';
            app.PropertiesofStationLabel.FontSize = 16;
            app.PropertiesofStationLabel.FontWeight = 'bold';
            app.PropertiesofStationLabel.Layout.Row = 1;
            app.PropertiesofStationLabel.Layout.Column = 4;
            app.PropertiesofStationLabel.Text = 'Properties of Station';

            % Create Data1
            app.Data1 = uieditfield(app.GridLayout6, 'numeric');
            app.Data1.Layout.Row = 6;
            app.Data1.Layout.Column = 3;

            % Create Data2
            app.Data2 = uieditfield(app.GridLayout6, 'numeric');
            app.Data2.Layout.Row = 7;
            app.Data2.Layout.Column = 3;

            % Create EditField
            app.EditField = uieditfield(app.GridLayout, 'text');
            app.EditField.Editable = 'off';
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.FontColor = [1 1 1];
            app.EditField.BackgroundColor = [0 0 0];
            app.EditField.Layout.Row = 1;
            app.EditField.Layout.Column = [3 5];
            app.EditField.Value = 'EE 101 Term Project 4';

            % Create RefreshDataButton
            app.RefreshDataButton = uibutton(app.GridLayout, 'push');
            app.RefreshDataButton.ButtonPushedFcn = createCallbackFcn(app, @RefreshDataButtonPushed, true);
            app.RefreshDataButton.BackgroundColor = [0.4667 0.6745 0.1882];
            app.RefreshDataButton.FontColor = [1 1 1];
            app.RefreshDataButton.Layout.Row = 9;
            app.RefreshDataButton.Layout.Column = [2 4];
            app.RefreshDataButton.Text = 'Refresh Data';

            % Create SaveButton
            app.SaveButton = uibutton(app.GridLayout, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.BackgroundColor = [0.6353 0.0784 0.1843];
            app.SaveButton.FontColor = [1 1 1];
            app.SaveButton.Layout.Row = 9;
            app.SaveButton.Layout.Column = [5 7];
            app.SaveButton.Text = 'Save';

            % Create NameField
            app.NameField = uieditfield(app.GridLayout, 'text');
            app.NameField.Editable = 'off';
            app.NameField.HorizontalAlignment = 'center';
            app.NameField.Layout.Row = 9;
            app.NameField.Layout.Column = 1;
            app.NameField.Value = 'Emir Tarık Arıcı';

            % Create VehiclesEditFieldLabel
            app.VehiclesEditFieldLabel = uilabel(app.GridLayout);
            app.VehiclesEditFieldLabel.HorizontalAlignment = 'center';
            app.VehiclesEditFieldLabel.FontColor = [1 1 1];
            app.VehiclesEditFieldLabel.Layout.Row = 1;
            app.VehiclesEditFieldLabel.Layout.Column = 1;
            app.VehiclesEditFieldLabel.Text = 'Vehicles';

            % Create VehiclesEditField
            app.VehiclesEditField = uieditfield(app.GridLayout, 'numeric');
            app.VehiclesEditField.HorizontalAlignment = 'center';
            app.VehiclesEditField.FontColor = [1 1 1];
            app.VehiclesEditField.BackgroundColor = [0 0 0];
            app.VehiclesEditField.Layout.Row = 2;
            app.VehiclesEditField.Layout.Column = 1;
            app.VehiclesEditField.Value = 1000;

            % Create StationsEditFieldLabel
            app.StationsEditFieldLabel = uilabel(app.GridLayout);
            app.StationsEditFieldLabel.HorizontalAlignment = 'center';
            app.StationsEditFieldLabel.FontColor = [1 1 1];
            app.StationsEditFieldLabel.Layout.Row = 1;
            app.StationsEditFieldLabel.Layout.Column = 2;
            app.StationsEditFieldLabel.Text = 'Stations';

            % Create StationsEditField
            app.StationsEditField = uieditfield(app.GridLayout, 'numeric');
            app.StationsEditField.HorizontalAlignment = 'center';
            app.StationsEditField.FontColor = [1 1 1];
            app.StationsEditField.BackgroundColor = [0 0 0];
            app.StationsEditField.Layout.Row = 2;
            app.StationsEditField.Layout.Column = 2;
            app.StationsEditField.Value = 50;

            % Create PossibleStateofChargeLabel
            app.PossibleStateofChargeLabel = uilabel(app.GridLayout);
            app.PossibleStateofChargeLabel.BackgroundColor = [0 0 0];
            app.PossibleStateofChargeLabel.HorizontalAlignment = 'right';
            app.PossibleStateofChargeLabel.FontColor = [1 1 1];
            app.PossibleStateofChargeLabel.Layout.Row = 1;
            app.PossibleStateofChargeLabel.Layout.Column = [6 7];
            app.PossibleStateofChargeLabel.Text = 'Possible State of Charge';

            % Create DropDown
            app.DropDown = uidropdown(app.GridLayout);
            app.DropDown.Items = {'20%', '30%', '40%', '50%', '60%', '70%', '80%'};
            app.DropDown.FontColor = [1 1 1];
            app.DropDown.BackgroundColor = [0 0 0];
            app.DropDown.Layout.Row = 2;
            app.DropDown.Layout.Column = 7;
            app.DropDown.Value = '50%';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.GridLayout, 'text');
            app.EditField_2.Editable = 'off';
            app.EditField_2.HorizontalAlignment = 'center';
            app.EditField_2.FontColor = [1 1 1];
            app.EditField_2.BackgroundColor = [0 0 0];
            app.EditField_2.Layout.Row = 2;
            app.EditField_2.Layout.Column = [3 5];
            app.EditField_2.Value = 'Electric Vehicle Charging Station Dashboard';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = EmirTarik_Arici_EE101_TermProject4_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end