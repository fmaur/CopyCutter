﻿#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# Generated On: 20.09.2021 14:01
# Generated By: Fabian Mauron
########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#region Generated Form Objects
$PrimalForms_Form = New-Object System.Windows.Forms.Form
$Button_Abbrechen = New-Object System.Windows.Forms.Button
$checkBox_cut = New-Object System.Windows.Forms.CheckBox
$CheckBox_Copy = New-Object System.Windows.Forms.CheckBox
$TextBox_PathZiel = New-Object System.Windows.Forms.TextBox
$Label_Description = New-Object System.Windows.Forms.Label
$Label_Header = New-Object System.Windows.Forms.Label
$TextBox_PathStart = New-Object System.Windows.Forms.TextBox
$TargetChange_Button = New-Object System.Windows.Forms.Button
$Ausführen_Button = New-Object System.Windows.Forms.Button
$StartChange_Button = New-Object System.Windows.Forms.Button
$StartBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$EndBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$InitialFormWindowState = New-Object System.Windows.Forms.FormWindowState
#endregion Generated Form Objects

#----------------------------------------------
#Generated Event Script Blocks
#----------------------------------------------
#Provide Custom Code for events specified in PrimalForms.

#Quell-Button
$StartChange_Button_Click= 
{
    $StartBrowser.ShowDialog()
    $ok = $StartBrowser.ShowDialog()

    if ($ok -eq "OK") {
        $TextBox_PathStart.Text = $StartBrowser.SelectedPath
    }

    else {
        $TextBox_PathStart.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,2,3,0)
        $TextBox_PathStart.Text = "Es wurde kein Ordner angewählt"
    }

    if ($TextBox_PathStart.Text -eq "Es wurde kein Ordner angewählt") {
        $StartChange_Button.Text = "Quelle ändern"
    }

    else {
        $StartChange_Button.Text = "Quelle ändern"
    }
}

#Ziel-Button
$TargetChange_Button_Click= 
{
    $EndBrowser.ShowDialog()
    $ok = $EndBrowser.ShowDialog()

    if ($ok -eq "OK") {
        $TextBox_PathZiel.Text = $EndBrowser.SelectedPath
    }

    else {
        $TextBox_PathZiel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,2,3,0)
        $TextBox_PathZiel.Text = "Es wurde kein Ordner angewählt"
    }

    if ($TextBox_PathZiel.Text -eq "Es wurde kein Ordner angewählt") {
        $TargetChange_Button.Text = "Ziel ändern"
    }

    else {
        $TargetChange_Button.Text = "Ziel ändern"
    }

}

$handler_label2_Click= 
{
#TODO: Place custom script here

}

#Execute-Button
$Ausführen_Button_Click= 
{
#TODO: Place custom script here

}

#Cancel-Button
$Button_Abbrechen_Click= 
{
    $script:answer="Abbrechen"; 
    $PrimalForms_Form.close()  
    Write-Warning "Sie haben die Anwendung beendet."

}

$handler_CheckBox_Copy_CheckedChanged= 
{
#Tool: Write-Warning "Sie haben den Status kopieren abgewählt"

}

$handler_CheckBox_Cut_CheckedChanged= 
{
#Tool: Write-Warning "Sie haben den Status verschieben abgewählt"

}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$PrimalForms_Form.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#region Generated Form Code
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 291
$System_Drawing_Size.Width = 283
$PrimalForms_Form.ClientSize = $System_Drawing_Size
$PrimalForms_Form.DataBindings.DefaultDataSourceUpdateMode = 0
$PrimalForms_Form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon('C:\Users\Fabian Mauron\OneDrive\Berufsschule\01-TBZ\14-M122\03-LB1_C.Winter\Dateien_Programm\Clipboard_icon_S1N1.ico')
$PrimalForms_Form.Name = "PrimalForms_Form"
$PrimalForms_Form.Text = "CopyCutter"

#Button für Close
$Button_Abbrechen.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 116
$System_Drawing_Point.Y = 256
$Button_Abbrechen.Location = $System_Drawing_Point
$Button_Abbrechen.Name = "Button_Abbrechen"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$Button_Abbrechen.Size = $System_Drawing_Size
$Button_Abbrechen.TabIndex = 5
$Button_Abbrechen.Text = "Abbrechen"
$Button_Abbrechen.UseVisualStyleBackColor = $True
$Button_Abbrechen.add_Click($Button_Abbrechen_Click)

$PrimalForms_Form.Controls.Add($Button_Abbrechen)

#Checkbox für Cut
$checkBox_cut.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 231
$checkBox_cut.Location = $System_Drawing_Point
$checkBox_cut.Name = "checkBox_cut"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$checkBox_cut.Size = $System_Drawing_Size
$checkBox_cut.TabIndex = 3
$checkBox_cut.Text = "Verschieben"
$checkBox_cut.UseVisualStyleBackColor = $True
$CheckBox_Copy.add_CheckedChanged($handler_CheckBox_cut_CheckedChanged)
$checkBox_cut.Checked = $False

$PrimalForms_Form.Controls.Add($checkBox_cut)

#Checkbox für Copy
$CheckBox_Copy.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 210
$CheckBox_Copy.Location = $System_Drawing_Point
$CheckBox_Copy.Name = "CheckBox_Copy"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$CheckBox_Copy.Size = $System_Drawing_Size
$CheckBox_Copy.TabIndex = 2
$CheckBox_Copy.Text = "Kopieren"
$CheckBox_Copy.UseVisualStyleBackColor = $True
$CheckBox_Copy.add_CheckedChanged($handler_CheckBox_Copy_CheckedChanged)
$checkBox_Copy.Checked = $true

$PrimalForms_Form.Controls.Add($CheckBox_Copy)

#Textbox für Zielpfad
$TextBox_PathZiel.DataBindings.DefaultDataSourceUpdateMode = 0
$TextBox_PathZiel.Enabled = $False
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 142
$TextBox_PathZiel.Location = $System_Drawing_Point
$TextBox_PathZiel.Name = "TextBox_PathZiel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 260
$TextBox_PathZiel.Size = $System_Drawing_Size

$PrimalForms_Form.Controls.Add($TextBox_PathZiel)

#Label für Beschreibung
$Label_Description.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 40
$Label_Description.Location = $System_Drawing_Point
$Label_Description.Name = "Label_Description"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 34
$System_Drawing_Size.Width = 259
$Label_Description.Size = $System_Drawing_Size
$Label_Description.Text = "Bitte wählen Sie erst die Ordner aus, die kopiert oder verschoben werden sollen."
$Label_Description.add_Click($handler_label2_Click)

$PrimalForms_Form.Controls.Add($Label_Description)

$Label_Header.DataBindings.DefaultDataSourceUpdateMode = 0
$Label_Header.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 13
$Label_Header.Location = $System_Drawing_Point
$Label_Header.Name = "Label_Header"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 100
$Label_Header.Size = $System_Drawing_Size
$Label_Header.Text = "CopyCutter"

$PrimalForms_Form.Controls.Add($Label_Header)

#Textbox für Quellpfad
$TextBox_PathStart.Cursor = [System.Windows.Forms.Cursors]::IBeam
$TextBox_PathStart.DataBindings.DefaultDataSourceUpdateMode = 0
$TextBox_PathStart.Enabled = $false
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 77
$TextBox_PathStart.Location = $System_Drawing_Point
$TextBox_PathStart.Name = "TextBox_PathStart"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 259
$TextBox_PathStart.Size = $System_Drawing_Size

$PrimalForms_Form.Controls.Add($TextBox_PathStart)

#Change-Button für Zielpfad
$TargetChange_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 168
$TargetChange_Button.Location = $System_Drawing_Point
$TargetChange_Button.Name = "TargetChange_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 101
$TargetChange_Button.Size = $System_Drawing_Size
$TargetChange_Button.TabIndex = 1
$TargetChange_Button.Text = "Ziel wählen"
$TargetChange_Button.UseVisualStyleBackColor = $True
$TargetChange_Button.add_Click($TargetChange_Button_Click)

$PrimalForms_Form.Controls.Add($TargetChange_Button)

#Execute-Button für Anwendung
$Ausführen_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 197
$System_Drawing_Point.Y = 256
$Ausführen_Button.Location = $System_Drawing_Point
$Ausführen_Button.Name = "Ausführen_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 75
$Ausführen_Button.Size = $System_Drawing_Size
$Ausführen_Button.TabIndex = 4
$Ausführen_Button.Text = "Ausführen"
$Ausführen_Button.UseVisualStyleBackColor = $True
$Ausführen_Button.add_Click($Ausführen_Button_Click)

$PrimalForms_Form.Controls.Add($Ausführen_Button)

#Change-Button für Quellpfad
$StartChange_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 103
$StartChange_Button.Location = $System_Drawing_Point
$StartChange_Button.Name = "StartChange_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 101
$StartChange_Button.Size = $System_Drawing_Size
$StartChange_Button.TabIndex = 0
$StartChange_Button.Text = "Quelle wählen"
$StartChange_Button.UseVisualStyleBackColor = $True
$StartChange_Button.add_Click($StartChange_Button_Click)

$PrimalForms_Form.Controls.Add($StartChange_Button)

#BrowserFenster für Startpfad
$StartBrowser.selectedPath = [Environment]::GetFolderPath('Desktop') 

#BrowserFenster für Zielpfad
$EndBrowser.selectedPath = [Environment]::GetFolderPath('Desktop') 

#endregion Generated Form Code

#Save the initial state of the form
$InitialFormWindowState = $PrimalForms_Form.WindowState
#Init the OnLoad event to correct the initial state of the form
$PrimalForms_Form.add_Load($OnLoadForm_StateCorrection)
#Show the Form
$PrimalForms_Form.ShowDialog()| Out-Null

} #End Function

#Call the Function
GenerateForm
