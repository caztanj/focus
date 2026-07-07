confirm_reload_dialog: Confirm_Reload_Dialog;

Confirm_Reload_Dialog :: struct {
    using #as generic_dialog: Generic_Confirm_Dialog(Dialog_Details);

    global_widget_id = .confirm_reload_dialog;
    set_details = dialog_set_details;
    get_buttons = dialog_get_buttons;
}

#scope_file

Dialog_Details :: struct { buffer_id: s64; path: string; }

dialog_set_details :: (details: Dialog_Details) {
    if confirm_reload_dialog.path then free(confirm_reload_dialog.path);
    confirm_reload_dialog.path = copy_string(details.path);
    confirm_reload_dialog.buffer_id = details.buffer_id;
}

dialog_get_buttons :: () -> [] Generic_Confirm_Dialog_Button {
    return .[
        .{ "Reload", .OK,     .[ #char "Y", #char "R" ], Color.UI_ERROR,   Color.UI_DEFAULT },
        .{ "Cancel", .CANCEL, .[ .ESCAPE, #char "N", #char "C" ], Color.UI_NEUTRAL, Color.UI_DEFAULT },
    ];
}
