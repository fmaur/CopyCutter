﻿#Generated Form Function
function GenerateForm {
########################################################################
# Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0
# ERSTELLDATUM: 20.09.2021 14:01
# ERSTELLER: Fabian Mauron
# GRUNDFUNKTION: 
# Skript erleichtert dem Anwender die Verwaltung der eigenen Ordnerstrukturen.
# Durch das einfach selektieren des Quellpfades und Zielpfades wird dem User
# das Herumklicken im Explorer erspahrt. Er kann auch im Nachhinein die Quelle 
# ändern. Das Hauptziel ist es, die Verwaltung der eigenen Ordnerstrukturen zu
# vereinfachen. 
#########################################################################

#region Import the Assemblies
[reflection.assembly]::loadwithpartialname("System.Drawing") | Out-Null
[reflection.assembly]::loadwithpartialname("System.Windows.Forms") | Out-Null
#endregion

#Variabledefinition der verschiedenen Objekte des GUI
$PrimalForms_Form = New-Object System.Windows.Forms.Form
$Button_Abbrechen = New-Object System.Windows.Forms.Button
$RadioButton_cut = New-Object System.Windows.Forms.RadioButton
$RadioButton_Copy = New-Object System.Windows.Forms.RadioButton
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

#Variabledefinitionen für Hintergrund-Aktion
$TextBox_PathStart.Text = "Bitte Quellpfad auswählen"
$TextBox_PathZiel.Text = "Bitte Zielpfad auswählen"

#Quell-Button
$StartChange_Button_Click= 
{
    #Directory-Search öffnen
    $ok = $StartBrowser.ShowDialog()

    #Textbox mit Pfad füllen
    if ($ok -eq "OK") {
        $TextBox_PathStart.Text = $StartBrowser.SelectedPath
        Write-Host $TextBox_PathStart.Text
    }

    #Textbox mit Fehlermeldung
    else {
        $TextBox_PathStart.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,2,3,0)
        $TextBox_PathStart.Text = "Es wurde kein Ordner angewählt"
        $StartChange_Button.Text = "Quelle ändern"
    }

    #Button mit Change-Text füllen
    if ($TextBox_PathStart.Text -eq "Es wurde kein Ordner angewählt") {
        $StartChange_Button.Text = "Quelle ändern"
    }

    #Button ebenfalls mit Change-Text füllen
    else {
        $StartChange_Button.Text = "Quelle ändern"
    }
}

#Ziel-Button
$TargetChange_Button_Click= 
{
    #Directory-Search öffnen
    $ok = $EndBrowser.ShowDialog()

    #Textbox mit Pfad füllen
    if ($ok -eq "OK") {
        $TextBox_PathZiel.Text = $EndBrowser.SelectedPath
        Write-Host $TextBox_PathZiel.Text
    }

    #Textbox mit Fehlermeldung
    else {
        $TextBox_PathZiel.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,2,3,0)
        $TextBox_PathZiel.Text = "Es wurde kein Ordner angewählt"
        $TargetChange_Button.Text = "Ziel ändern"
    }

    #Button mit Change-Text füllen
    if ($TextBox_PathZiel.Text -eq "Es wurde kein Ordner angewählt") {
        $TargetChange_Button.Text = "Ziel ändern"
    }

    #Button ebenfalls mit Change-Text füllen
    else {
        $TargetChange_Button.Text = "Ziel ändern"
    }

}

$handler_label2_Click= 
{
#TODO: Kein Bedarf, Existenz für evt. Bedarf behalten.

}

$handler_CheckBox_Copy_CheckedChanged=
{
#TODO: Kein Bedarf, Existenz für evt. Bedarf behalten.

}

#Execute-Button
$Ausführen_Button_Click= 
{
    #Fehlermeldung (mit MessageBox) für Nichteingabe des Zielpfades
    if ($TextBox_PathZiel.Text -eq "Es wurde kein Ordner angewählt" -or $TextBox_PathStart.Text -eq "Bitte Quellpfad auswählen" -or $TextBox_PathStart.Text -eq "Es wurde kein Ordner angewählt" -or $TextBox_PathZiel.Text -eq "Bitte Zielpfad auswählen") {
           [System.Windows.Forms.MessageBox]::Show("Bitte vervollständigen Sie ihre Angaben.","Angaben vervollständigen",0, [System.Windows.Forms.MessageBoxIcon]::Exclamation)
    }

    else {

        #Feststellen der Auswahl bei RadioButtons und Weitergabe in Variable
        if ($RadioButton_Copy.Checked -eq $true -and $RadioButton_Cut.Checked -eq $false) {
            $RadioButton_Cut.Checked = $false
            $CopyCutter = "copy"

            #Kopieren der gewünschten Directory an ihr Ziel, anschliessendes öffnen des Explorers.
            if ($CopyCutter -eq "Copy") {
                Copy-Item -Path $TextBox_PathStart.Text -Destination $TextBox_PathZiel.Text -Recurse
            }
            ii $TextBox_PathZiel.Text
            $PrimalForms_Form.close()
        }
        elseif ($RadioButton_Copy.Checked -eq $false -and $RadioButton_Cut.Checked -eq $true) {
            $RadioButton_Copy.Checked = $false
            $CopyCutter = "cut"

            #Verschieben der gewünschten Directory an ihr Ziel, anschliessendes öffnen des Explorers.
            if ($CopyCutter -eq "cut") {
                Move-Item -Path $TextBox_PathStart.Text -Destination $TextBox_PathZiel.Text
            }
            ii $TextBox_PathZiel.Text
            $PrimalForms_Form.close()
        }
        else {
            $RadioButton_Cut.Checked = $false
            $RadioButton_Copy.Checked = $true
            [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie kopieren oder verschieben.","Auswahl treffen",0, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
    }
}

#Cancel-Button der Anwendung beendet
$Button_Abbrechen_Click= 
{
    $script:answer="Abbrechen"; 
    $PrimalForms_Form.close()  
    Write-Warning "Sie haben die Anwendung beendet."
}

$OnLoadForm_StateCorrection=
{#Correct the initial state of the form to prevent the .Net maximized form issue
	$PrimalForms_Form.WindowState = $InitialFormWindowState
}

#----------------------------------------------
#GUI-Angabe Form selbst
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 291
$System_Drawing_Size.Width = 300
$PrimalForms_Form.ClientSize = $System_Drawing_Size
$PrimalForms_Form.DataBindings.DefaultDataSourceUpdateMode = 0
$PrimalForms_Form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon('C:\Users\Fabian Mauron\OneDrive\Berufsschule\01-TBZ\14-M122\03-LB1_C.Winter\Dateien_Programm\Clipboard_icon_S1N1.ico')
$PrimalForms_Form.Name = "PrimalForms_Form"
$PrimalForms_Form.Text = "CopyCutter"

#GUI-Angabe Button für Close
$Button_Abbrechen.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 110
$System_Drawing_Point.Y = 256
$Button_Abbrechen.Location = $System_Drawing_Point
$Button_Abbrechen.Name = "Button_Abbrechen"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 25
$System_Drawing_Size.Width = 85
$Button_Abbrechen.Size = $System_Drawing_Size
$Button_Abbrechen.TabIndex = 5
$Button_Abbrechen.Text = "Abbrechen"
$Button_Abbrechen.UseVisualStyleBackColor = $True
$Button_Abbrechen.add_Click($Button_Abbrechen_Click)

$PrimalForms_Form.Controls.Add($Button_Abbrechen)

#GUI-Angabe Radionbutton für Cut
$RadioButton_cut.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 231
$RadioButton_cut.Location = $System_Drawing_Point
$RadioButton_cut.Name = "checkBox_cut"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 115
$RadioButton_cut.Size = $System_Drawing_Size
$RadioButton_cut.TabIndex = 3
$RadioButton_cut.Text = "Verschieben"
$RadioButton_cut.UseVisualStyleBackColor = $True
$RadioButton_Copy.add_CheckedChanged($handler_CheckBox_cut_CheckedChanged)
$RadioButton_cut.Checked = $False

$PrimalForms_Form.Controls.Add($RadioButton_cut)

#GUI-Angabe Radiobutton für Copy
$RadioButton_Copy.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 210
$RadioButton_Copy.Location = $System_Drawing_Point
$RadioButton_Copy.Name = "CheckBox_Copy"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 24
$System_Drawing_Size.Width = 104
$RadioButton_Copy.Size = $System_Drawing_Size
$RadioButton_Copy.TabIndex = 2
$RadioButton_Copy.Text = "Kopieren"
$RadioButton_Copy.UseVisualStyleBackColor = $True
$RadioButton_Copy.add_CheckedChanged($handler_CheckBox_Copy_CheckedChanged)
$RadioButton_Copy.Checked = $true

$PrimalForms_Form.Controls.Add($RadioButton_Copy)

#GUI-Angabe Textbox für Zielpfad
$TextBox_PathZiel.DataBindings.DefaultDataSourceUpdateMode = 0
$TextBox_PathZiel.Enabled = $False
$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 142
$TextBox_PathZiel.Location = $System_Drawing_Point
$TextBox_PathZiel.Name = "TextBox_PathZiel"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 20
$System_Drawing_Size.Width = 275
$TextBox_PathZiel.Size = $System_Drawing_Size

$PrimalForms_Form.Controls.Add($TextBox_PathZiel)

#GUI-Angabe Label für Beschreibung
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
$Label_Description.Text = "Bitte wählen Sie  die Ordner aus, die kopiert oder verschoben werden sollen."
$Label_Description.add_Click($handler_label2_Click)

$PrimalForms_Form.Controls.Add($Label_Description)

#GUI-Angabe Label für Header
$Label_Header.DataBindings.DefaultDataSourceUpdateMode = 0
$Label_Header.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",11.25,1,3,1)

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 13
$System_Drawing_Point.Y = 13
$Label_Header.Location = $System_Drawing_Point
$Label_Header.Name = "Label_Header"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 23
$System_Drawing_Size.Width = 150
$Label_Header.Size = $System_Drawing_Size
$Label_Header.Text = "CopyCutter"

$PrimalForms_Form.Controls.Add($Label_Header)

#GUI-Angabe Textbox für Quellpfad
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
$System_Drawing_Size.Width = 275
$TextBox_PathStart.Size = $System_Drawing_Size

$PrimalForms_Form.Controls.Add($TextBox_PathStart)

#GUI-Angabe Change-Button für Zielpfad
$TargetChange_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 168
$TargetChange_Button.Location = $System_Drawing_Point
$TargetChange_Button.Name = "TargetChange_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 25
$System_Drawing_Size.Width = 105
$TargetChange_Button.Size = $System_Drawing_Size
$TargetChange_Button.TabIndex = 1
$TargetChange_Button.Text = "Ziel wählen"
$TargetChange_Button.UseVisualStyleBackColor = $True
$TargetChange_Button.add_Click($TargetChange_Button_Click)

$PrimalForms_Form.Controls.Add($TargetChange_Button)

#GUI-Angabe Execute-Button für Anwendung
$Ausführen_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 197
$System_Drawing_Point.Y = 256
$Ausführen_Button.Location = $System_Drawing_Point
$Ausführen_Button.Name = "Ausführen_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 25
$System_Drawing_Size.Width = 80
$Ausführen_Button.Size = $System_Drawing_Size
$Ausführen_Button.TabIndex = 4
$Ausführen_Button.Text = "Ausführen"
$Ausführen_Button.UseVisualStyleBackColor = $True
$Ausführen_Button.add_Click($Ausführen_Button_Click)

$PrimalForms_Form.Controls.Add($Ausführen_Button)

#GUI-Angabe Change-Button für Quellpfad
$StartChange_Button.DataBindings.DefaultDataSourceUpdateMode = 0

$System_Drawing_Point = New-Object System.Drawing.Point
$System_Drawing_Point.X = 12
$System_Drawing_Point.Y = 103
$StartChange_Button.Location = $System_Drawing_Point
$StartChange_Button.Name = "StartChange_Button"
$System_Drawing_Size = New-Object System.Drawing.Size
$System_Drawing_Size.Height = 25
$System_Drawing_Size.Width = 105
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
