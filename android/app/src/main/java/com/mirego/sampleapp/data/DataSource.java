package com.mirego.sampleapp.data;

import java.util.Date;

public interface DataSource {

    interface RefreshCallback {
        void onRefreshFinished();
    }

    void refreshData();

    Date getCurrentDate();

    void setRefreshCallback(RefreshCallback refreshCallback);
}
