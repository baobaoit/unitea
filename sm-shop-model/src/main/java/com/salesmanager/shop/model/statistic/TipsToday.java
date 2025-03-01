package com.salesmanager.shop.model.statistic;

import java.io.Serializable;

public class TipsToday implements Serializable {

	private static final long serialVersionUID = -1197571998192682797L;

	private String tipsToday;
	private String totalTip;

	public String getTipsToday() {
		return tipsToday;
	}

	public void setTipsToday(String tipsToday) {
		this.tipsToday = tipsToday;
	}

	public String getTotalTip() {
		return totalTip;
	}

	public void setTotalTip(String totalTip) {
		this.totalTip = totalTip;
	}

}
