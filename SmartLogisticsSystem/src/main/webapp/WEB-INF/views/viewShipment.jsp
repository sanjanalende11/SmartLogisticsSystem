<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Shipments | SmartLogisticsSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&family=Space+Grotesk:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	scroll-behavior: smooth;
}

body {
	font-family: 'Outfit', sans-serif;
	background: #ffffff;
	color: #1f2937;
	min-height: 100vh;
	overflow-x: hidden;
	-webkit-font-smoothing: antialiased;
}

::-webkit-scrollbar {
	width: 8px;
}

::-webkit-scrollbar-track {
	background: #fefefe;
}

::-webkit-scrollbar-thumb {
	background: linear-gradient(180deg, #d4a574, #b8864a);
	border-radius: 99px;
}

:root {
	--gold-primary: #d4a574;
	--gold-light: #e8c9a0;
	--gold-dark: #b8864a;
	--gold-pale: #fdf8f3;
	--gold-shimmer: #f5e6d3;
	--white-pure: #ffffff;
	--white-soft: #fafaf9;
	--white-warm: #fefdfb;
	--text-primary: #2c1810;
	--text-secondary: #5c4033;
	--text-muted: #8b7355;
	--border-gold: #e8d4bc;
	--border-light: #f0e6dc;
	--success: #7cb87c;
	--warning: #d4a020;
	--info: #6b8eb8;
	--danger: #c45c5c;
	--input-bg: #fdfbf9;
	--shadow-gold: 0 10px 30px rgba(180, 134, 74, 0.12);
	--shadow-elegant: 0 20px 50px rgba(44, 24, 16, 0.06);
	--shadow-hover: 0 25px 60px rgba(180, 134, 74, 0.18);
}

a {
	text-decoration: none;
	color: inherit;
}

/* Elegant Gold Background Orbs */
.bg-orbs {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	pointer-events: none;
	z-index: 0;
	overflow: hidden;
}

.bg-orb {
	position: absolute;
	border-radius: 50%;
	filter: blur(120px);
	opacity: 0.35;
	animation: orbFloat 25s ease-in-out infinite;
}

.bg-orb:nth-child(1) {
	width: 600px;
	height: 600px;
	background: radial-gradient(circle, rgba(212, 165, 116, 0.15),
		transparent 70%);
	top: -10%;
	right: -5%;
	animation-delay: 0s;
}

.bg-orb:nth-child(2) {
	width: 450px;
	height: 450px;
	background: radial-gradient(circle, rgba(232, 201, 160, 0.15),
		transparent 70%);
	bottom: -5%;
	left: -5%;
	animation-delay: -8s;
	animation-duration: 28s;
}

.bg-orb:nth-child(3) {
	width: 300px;
	height: 300px;
	background: radial-gradient(circle, rgba(184, 134, 74, 0.08),
		transparent 70%);
	top: 40%;
	left: 45%;
	animation-delay: -4s;
	animation-duration: 20s;
}

@
keyframes orbFloat { 0%,100%{
	transform: translate(0, 0) scale(1);
}

33






%
{
transform






:






translate




(






40px
,
-45px






)






scale




(






1




.06






)




;
}
66






%
{
transform






:






translate




(






-30px
,
35px






)






scale




(






0




.95






)




;
}
}
.page-content {
	position: relative;
	z-index: 1;
}

/* Premium Navigation Bar */
.navbar-premium {
	background: rgba(255, 255, 255, 0.92);
	backdrop-filter: blur(25px) saturate(2);
	-webkit-backdrop-filter: blur(25px) saturate(2);
	border-bottom: 1px solid var(--border-gold);
	position: sticky;
	top: 0;
	z-index: 1000;
	box-shadow: 0 4px 20px rgba(212, 165, 116, 0.08);
}

.nav-inner {
	display: flex;
	align-items: center;
	padding: 16px 0;
	gap: 16px;
}

.logo-premium {
	display: flex;
	align-items: center;
	gap: 14px;
	flex-shrink: 0;
}

.logo-icon {
	width: 46px;
	height: 46px;
	background: linear-gradient(135deg, var(--gold-primary),
		var(--gold-dark));
	border-radius: 14px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 19px;
	color: #ffffff;
	box-shadow: 0 12px 28px rgba(212, 165, 116, 0.35);
	position: relative;
	overflow: hidden;
}

.logo-icon::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.4),
		transparent);
	transform: translateX(-120%);
	animation: shine 4.5s infinite;
}

@
keyframes shine { 0%{
	transform: translateX(-120%);
}

45






%
,
100






%
{
transform






:






translateX




(






120




%
)




;
}
}
.logo-text {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 22px;
	font-weight: 700;
	color: var(--text-primary);
	letter-spacing: -0.5px;
}

.logo-text span {
	background: linear-gradient(135deg, var(--gold-light), var(--gold-dark));
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	background-clip: text;
}

.nav-spacer {
	flex: 1;
}

.nav-actions {
	display: flex;
	align-items: center;
	gap: 12px;
	flex-shrink: 0;
}

.nav-btn {
	display: inline-flex;
	align-items: center;
	gap: 8px;
	padding: 11px 20px;
	border-radius: 13px;
	font-size: 14px;
	font-weight: 600;
	transition: all 0.35s ease;
	cursor: pointer;
	border: none;
	font-family: 'Outfit', sans-serif;
}

.nav-btn-ghost {
	background: var(--white-pure);
	color: var(--text-secondary);
	border: 1px solid var(--border-gold);
	box-shadow: 0 6px 20px rgba(44, 24, 16, 0.04);
}

.nav-btn-ghost:hover {
	background: var(--gold-pale);
	color: var(--gold-dark);
	border-color: var(--gold-primary);
	transform: translateY(-2px);
	box-shadow: var(--shadow-gold);
}

.page-wrap {
	padding: 48px 0 100px;
}

/* Hero Card - Pure White & Gold */
.hero-card {
	background: linear-gradient(135deg, var(--white-pure) 0%,
		var(--white-warm) 100%);
	border: 1px solid var(--border-gold);
	border-radius: 30px;
	padding: 38px 44px;
	margin-bottom: 32px;
	position: relative;
	overflow: hidden;
	box-shadow: var(--shadow-elegant);
}

.hero-card::before {
	content: '';
	position: absolute;
	top: 0;
	left: 10%;
	right: 10%;
	height: 2px;
	background: linear-gradient(90deg, transparent, var(--gold-primary),
		var(--gold-light), var(--gold-primary), transparent);
}

.hero-card::after {
	content: '';
	position: absolute;
	width: 280px;
	height: 280px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(212, 165, 116, 0.08),
		transparent 70%);
	top: -110px;
	right: -80px;
	pointer-events: none;
}

.hero-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 24px;
	flex-wrap: wrap;
}

.page-title {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 36px;
	font-weight: 700;
	margin-bottom: 12px;
	color: var(--text-primary);
	letter-spacing: -1px;
}

.page-subtitle {
	color: var(--text-secondary);
	font-size: 16px;
	max-width: 750px;
	line-height: 1.75;
	margin-bottom: 0;
}

.hero-badges {
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
	margin-top: 22px;
}

.hero-chip {
	display: inline-flex;
	align-items: center;
	gap: 9px;
	padding: 11px 16px;
	border-radius: 999px;
	background: linear-gradient(135deg, var(--white-pure), var(--gold-pale));
	border: 1px solid var(--border-gold);
	color: var(--text-muted);
	font-size: 13px;
	font-weight: 600;
	box-shadow: 0 8px 20px rgba(212, 165, 116, 0.06);
	transition: all 0.3s ease;
}

.hero-chip:hover {
	border-color: var(--gold-primary);
	color: var(--gold-dark);
	transform: translateY(-1px);
}

.hero-chip i {
	color: var(--gold-dark);
}

.btn-back-main {
	display: inline-flex;
	align-items: center;
	gap: 10px;
	padding: 15px 28px;
	border-radius: 16px;
	background: linear-gradient(135deg, var(--gold-primary),
		var(--gold-dark));
	color: #ffffff;
	font-size: 15px;
	font-weight: 700;
	border: none;
	cursor: pointer;
	box-shadow: 0 18px 38px rgba(212, 165, 116, 0.32);
	transition: all 0.35s ease;
	white-space: nowrap;
}

.btn-back-main:hover {
	color: #fff;
	transform: translateY(-3px);
	box-shadow: 0 22px 45px rgba(212, 165, 116, 0.42);
}

/* Alert Messages - Gold Tinted */
.alert-custom {
	background: var(--white-pure);
	border-radius: 16px;
	padding: 17px 22px;
	margin-bottom: 26px;
	border: 1px solid;
	display: flex;
	align-items: center;
	gap: 14px;
	font-weight: 600;
	box-shadow: var(--shadow-gold);
}

.alert-success-custom {
	background: linear-gradient(135deg, #f7fcf8, #f0f9f4);
	border-color: #c8e6c9;
	color: #2e7d32;
}

.alert-danger-custom {
	background: linear-gradient(135deg, #fff8f8, #fff0f0);
	border-color: #f5c6c6;
	color: #c62828;
}

/* Stats Grid - Gold Accented Cards */
.stats-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 22px;
	margin-bottom: 34px;
}

.stats-card {
	background: linear-gradient(180deg, var(--white-pure), var(--white-soft));
	border: 1px solid var(--border-gold);
	border-radius: 24px;
	padding: 28px;
	box-shadow: var(--shadow-gold);
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: all 0.4s ease;
	position: relative;
	overflow: hidden;
	min-height: 140px;
}

.stats-card::before {
	content: "";
	position: absolute;
	inset: 0 auto 0 0;
	width: 5px;
	background: linear-gradient(180deg, var(--gold-primary),
		var(--gold-light));
	opacity: 0.95;
}

.stats-card::after {
	content: "";
	position: absolute;
	width: 100px;
	height: 100px;
	right: -26px;
	bottom: -26px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(212, 165, 116, 0.10),
		transparent 70%);
}

.stats-card:hover {
	transform: translateY(-6px);
	border-color: var(--gold-primary);
	box-shadow: var(--shadow-hover);
}

.stats-info h3 {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 36px;
	font-weight: 700;
	color: var(--text-primary);
	margin: 0;
	line-height: 1;
}

.stats-info p {
	font-size: 12.5px;
	color: var(--text-muted);
	margin: 10px 0 0 0;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 1px;
}

.stats-icon-box {
	width: 62px;
	height: 62px;
	border-radius: 20px;
	background: linear-gradient(135deg, rgba(212, 165, 116, 0.12),
		rgba(232, 201, 160, 0.22));
	border: 1px solid rgba(212, 165, 116, 0.20);
	color: var(--gold-dark);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	box-shadow: inset 0 2px 0 rgba(255, 255, 255, 0.7);
}

/* Table Container - Elegant Gold Frame */
.table-card {
	background: var(--white-pure);
	border: 1px solid var(--border-gold);
	border-radius: 28px;
	overflow: hidden;
	box-shadow: var(--shadow-elegant);
	margin-bottom: 90px;
	position: relative;
}

.table-card::before {
	content: "";
	position: absolute;
	top: 0;
	left: 8%;
	right: 8%;
	height: 2px;
	background: linear-gradient(90deg, transparent, var(--gold-light),
		var(--gold-primary), var(--gold-light), transparent);
	z-index: 1;
}

.table-header-section {
	padding: 28px 34px 22px;
	border-bottom: 1px solid var(--border-light);
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	background: linear-gradient(180deg, var(--white-warm), var(--gold-pale));
}

.table-title {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 24px;
	font-weight: 700;
	color: var(--text-primary);
	letter-spacing: -0.5px;
}

.table-hint {
	font-size: 13.5px;
	color: var(--text-muted);
	display: flex;
	align-items: center;
	gap: 8px;
	margin-top: 6px;
}

.filter-bar {
	padding: 24px 34px;
	background: var(--white-pure);
	border-bottom: 1px solid var(--border-light);
}

.search-box, .filter-select {
	background: var(--input-bg);
	border: 1px solid var(--border-gold);
	color: var(--text-primary);
	border-radius: 15px;
	padding: 14px 18px;
	transition: all 0.35s ease;
	min-height: 52px;
}

.search-box::placeholder {
	color: var(--text-muted);
}

.search-box:focus, .filter-select:focus {
	background: var(--white-pure);
	border-color: var(--gold-primary);
	box-shadow: 0 0 0 5px rgba(212, 165, 116, 0.12);
	outline: none;
}

/* Premium Table Styling */
.table-custom {
	width: 100%;
	margin-bottom: 0;
	border-collapse: separate;
	border-spacing: 0;
}

.table-custom thead th {
	background: linear-gradient(180deg, var(--gold-pale), #faf6f1);
	color: var(--text-secondary);
	font-weight: 700;
	font-size: 13px;
	text-transform: uppercase;
	letter-spacing: 1px;
	padding: 20px 30px;
	border-bottom: 2px solid var(--border-gold);
	text-align: left;
	white-space: nowrap;
}

.table-custom tbody td {
	padding: 20px 30px;
	border-bottom: 1px solid var(--border-light);
	color: var(--text-primary);
	font-size: 15px;
	vertical-align: middle;
	background: var(--white-pure);
	position: relative;
}

.table-custom tbody tr {
	transition: all 0.3s ease;
}

.table-custom tbody tr:hover td {
	background: linear-gradient(90deg, rgba(212, 165, 116, 0.04),
		rgba(255, 255, 255, 1));
}

.table-custom tbody tr:last-child td {
	border-bottom: none;
}

.shipment-id strong {
	color: var(--text-primary);
	font-weight: 800;
	font-family: 'Space Grotesk', sans-serif;
}

.row-number {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 32px;
	height: 32px;
	border-radius: 11px;
	background: var(--gold-pale);
	border: 1px solid var(--border-gold);
	color: var(--gold-dark);
	font-size: 12.5px;
	font-weight: 700;
}

.driver-wrap {
	display: flex;
	align-items: center;
	gap: 11px;
	justify-content: center;
}

.driver-icon {
	width: 34px;
	height: 34px;
	border-radius: 50%;
	background: linear-gradient(135deg, rgba(212, 165, 116, 0.12),
		rgba(232, 201, 160, 0.20));
	color: var(--gold-dark);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 13px;
	border: 1px solid rgba(212, 165, 116, 0.20);
	flex-shrink: 0;
}

.driver-text {
	font-weight: 600;
	color: var(--text-primary);
}

.driver-empty {
	color: var(--text-muted);
	font-weight: 600;
}

/* Status Badges - Gold Palette */
.status-badge {
	padding: 8px 18px;
	border-radius: 999px;
	font-size: 12.5px;
	font-weight: 700;
	display: inline-block;
	text-transform: capitalize;
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.6);
	border: 1px solid;
}

.badge-pending {
	background: linear-gradient(135deg, #fef8e8, #fef3cd);
	color: #856404;
	border-color: rgba(184, 134, 74, 0.25);
}

.badge-shipped {
	background: linear-gradient(135deg, #e8f0fe, #d4e4fc);
	color: #1a5276;
	border-color: rgba(107, 142, 184, 0.25);
}

.badge-delivered {
	background: linear-gradient(135deg, #eafaf1, #d5f5e3);
	color: #1e8449;
	border-color: rgba(124, 184, 124, 0.25);
}

.badge-cancelled {
	background: linear-gradient(135deg, #fdedec, #fadbd8);
	color: #943126;
	border-color: rgba(196, 92, 92, 0.25);
}

.badge-default {
	background: var(--white-soft);
	color: var(--text-secondary);
	border-color: var(--border-light);
}

/* Action Buttons - Gold Theme */
.action-group {
	display: flex;
	flex-wrap: wrap;
	gap: 9px;
}

.btn-action-mini {
	padding: 9px 14px;
	border-radius: 11px;
	font-size: 11.5px;
	font-weight: 700;
	display: inline-flex;
	align-items: center;
	gap: 6px;
	border: 1px solid;
	transition: all 0.32s ease;
	background: var(--white-pure);
	box-shadow: 0 6px 16px rgba(44, 24, 16, 0.04);
}

.btn-view {
	border-color: var(--info);
	color: var(--info);
	background: linear-gradient(135deg, #f0f5fa, #e8f0f8);
}

.btn-view:hover {
	background: var(--info);
	color: #fff;
	transform: translateY(-2px);
	box-shadow: 0 10px 24px rgba(107, 142, 184, 0.3);
}

.btn-assign {
	border-color: var(--gold-primary);
	color: var(--gold-dark);
	background: linear-gradient(135deg, #fdf8f3, #faedd8);
}

.btn-assign:hover {
	background: linear-gradient(135deg, var(--gold-primary),
		var(--gold-dark));
	color: #fff;
	transform: translateY(-2px);
	box-shadow: 0 10px 24px rgba(212, 165, 116, 0.35);
}

.btn-update {
	border-color: var(--success);
	color: var(--success);
	background: linear-gradient(135deg, #f2f9f3, #e8f5ea);
}

.btn-update:hover {
	background: var(--success);
	color: #fff;
	transform: translateY(-2px);
	box-shadow: 0 10px 24px rgba(124, 184, 124, 0.3);
}

/* Empty State - Gold Elegance */
.empty-state-box {
	background: linear-gradient(180deg, var(--white-pure), var(--white-soft));
	border: 1px solid var(--border-gold);
	border-radius: 26px;
	padding: 70px 44px;
	text-align: center;
	box-shadow: var(--shadow-gold);
	max-width: 580px;
	margin: 36px auto;
	position: relative;
	overflow: hidden;
}

.empty-state-box::after {
	content: "";
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;
	background: radial-gradient(circle, rgba(212, 165, 116, 0.08),
		transparent 70%);
	top: -46px;
	right: -40px;
}

.empty-icon {
	width: 90px;
	height: 90px;
	margin: 0 auto 20px;
	border-radius: 26px;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(135deg, rgba(212, 165, 116, 0.12),
		rgba(232, 201, 160, 0.22));
	color: var(--gold-dark);
	font-size: 34px;
	border: 1px solid rgba(212, 165, 116, 0.18);
}

/* Modal - Dark Gold Theme for Contrast */
.modal-content.custom-dark {
	background: linear-gradient(180deg, #2c1810, #1a0f0a);
	color: #f9f6f3;
	border: 1px solid rgba(212, 165, 116, 0.15);
	box-shadow: 0 30px 80px rgba(0, 0, 0, 0.5);
	border-radius: 26px;
	overflow: hidden;
}

.modal-header-custom {
	border-bottom: 1px solid rgba(212, 165, 116, 0.15);
	background: rgba(212, 165, 116, 0.04);
}

.modal-title-custom {
	font-family: 'Space Grotesk', sans-serif;
	font-size: 19px;
	font-weight: 700;
	margin: 0;
	color: #f9f6f3;
}

.modal-body-custom {
	padding: 32px 26px;
}

.modal-footer-custom {
	border-top: 1px solid rgba(212, 165, 116, 0.15);
	background: rgba(0, 0, 0, 0.2);
}

.form-label-custom {
	font-size: 13.5px;
	font-weight: 600;
	color: var(--gold-light);
	margin-bottom: 9px;
	display: block;
}

.form-control-custom, .form-select.form-control-custom {
	background: #3d261a;
	border: 1px solid rgba(212, 165, 116, 0.18);
	color: #f9f6f3;
	border-radius: 14px;
	padding: 13px 17px;
	width: 100%;
	transition: all 0.35s ease;
}

.form-control-custom:focus, .form-select.form-control-custom:focus {
	background: #2c1810;
	border-color: var(--gold-primary);
	color: #ffffff;
	outline: none;
	box-shadow: 0 0 0 5px rgba(212, 165, 116, 0.18);
}

.btn-modal-cancel {
	background: transparent;
	color: var(--gold-light);
	border: 1px solid rgba(212, 165, 116, 0.2);
	padding: 11px 26px;
	border-radius: 13px;
	font-weight: 600;
	transition: all 0.35s ease;
}

.btn-modal-cancel:hover {
	background: rgba(212, 165, 116, 0.1);
	color: #ffffff;
	border-color: var(--gold-primary);
}

.btn-modal-submit {
	background: linear-gradient(135deg, var(--gold-primary),
		var(--gold-dark));
	color: #fff;
	border: none;
	padding: 11px 26px;
	border-radius: 13px;
	font-weight: 700;
	box-shadow: 0 10px 22px rgba(212, 165, 116, 0.28);
	transition: all 0.35s ease;
}

.btn-modal-submit:hover {
	transform: translateY(-2px);
	box-shadow: 0 14px 28px rgba(212, 165, 116, 0.38);
}

/* Responsive Design */
@media ( max-width :768px) {
	.hero-card {
		padding: 28px;
	}
	.page-title {
		font-size: 30px;
	}
	.table-header-section {
		flex-direction: column;
		align-items: flex-start;
		gap: 12px;
	}
	.stats-grid {
		grid-template-columns: 1fr;
	}
	.action-group {
		flex-direction: column;
	}
	.table-custom thead th, .table-custom tbody td {
		padding: 18px 16px;
	}
	.btn-back-main {
		width: 100%;
		justify-content: center;
	}
	.hero-top {
		flex-direction: column;
		text-align: center;
	}
	.hero-badges {
		justify-content: center;
	}
}
</style>
</head>
<body>

	<div class="bg-orbs">
		<div class="bg-orb"></div>
		<div class="bg-orb"></div>
		<div class="bg-orb"></div>
	</div>

	<div class="page-content">

		<nav class="navbar-premium">
			<div class="container">
				<div class="nav-inner">
					<a href="index" class="logo-premium">
						<div class="logo-icon">
							<i class="fa-solid fa-truck-fast"></i>
						</div>
						<div class="logo-text">
							Smart<span>Logistics</span>
						</div>
					</a>
					<div class="nav-spacer"></div>
					<div class="nav-actions">
						<a href="${pageContext.request.contextPath}/admindashboard"
							class="nav-btn nav-btn-ghost"> <i
							class="fa-solid fa-table-columns"></i> Dashboard
						</a> <a href="${pageContext.request.contextPath}/admindashboard"
							class="btn-back-main"> <i class="fa-solid fa-arrow-left"></i>
							Back
						</a>
					</div>
				</div>
			</div>
		</nav>

		<div class="container page-wrap">

			<c:if test="${not empty success}">
				<div class="alert-custom alert-success-custom">
					<i class="fa-solid fa-circle-check"></i> ${success}
				</div>
			</c:if>

			<c:if test="${not empty error}">
				<div class="alert-custom alert-danger-custom">
					<i class="fa-solid fa-circle-exclamation"></i> ${error}
				</div>
			</c:if>

			<div class="hero-card">
				<div class="hero-top">
					<div>
						<h1 class="page-title">Manage Shipments</h1>
						<p class="page-subtitle">Monitor logistics, assign drivers,
							update delivery progress, and manage shipment records with a
							cleaner premium admin experience.</p>

						<div class="hero-badges">
							<div class="hero-chip">
								<i class="fa-solid fa-route"></i> Shipment Monitoring
							</div>
							<div class="hero-chip">
								<i class="fa-solid fa-user-gear"></i> Driver Assignment
							</div>
							<div class="hero-chip">
								<i class="fa-solid fa-box-open"></i> Order Tracking
							</div>
						</div>
					</div>

					<a href="${pageContext.request.contextPath}/admindashboard" class="btn-back-main"> <i
						class="fa-solid fa-arrow-left"></i> Back
					</a>
				</div>
			</div>

			<div class="stats-grid">
				<div class="stats-card">
					<div class="stats-info">
						<h3 id="totalShipments">0</h3>
						<p>Total Shipments</p>
					</div>
					<div class="stats-icon-box">
						<i class="fa-solid fa-boxes-stacked"></i>
					</div>
				</div>

				<div class="stats-card">
					<div class="stats-info">
						<h3 id="pendingCount" style="color: var(--warning)">0</h3>
						<p style="color: var(--warning);">Pending</p>
					</div>
					<div class="stats-icon-box"
						style="background: rgba(212, 160, 32, 0.12); color: var(--warning);">
						<i class="fa-solid fa-hourglass-half"></i>
					</div>
				</div>

				<div class="stats-card">
					<div class="stats-info">
						<h3 id="shippedCount" style="color: var(--info)">0</h3>
						<p style="color: var(--info);">Shipped</p>
					</div>
					<div class="stats-icon-box"
						style="background: rgba(107, 142, 184, 0.12); color: var(--info);">
						<i class="fa-solid fa-truck"></i>
					</div>
				</div>

				<div class="stats-card">
					<div class="stats-info">
						<h3 id="deliveredCount" style="color: var(--success)">0</h3>
						<p style="color: var(--success);">Delivered</p>
					</div>
					<div class="stats-icon-box"
						style="background: rgba(124, 184, 124, 0.12); color: var(--success);">
						<i class="fa-solid fa-circle-check"></i>
					</div>
				</div>
			</div>

			<div class="table-card">
				<div class="table-header-section">
					<div>
						<div class="table-title">Shipment Records</div>
						<div class="table-hint">
							<i class="fa-solid fa-filter"></i> Search and filter your
							logistics records instantly
						</div>
					</div>
				</div>

				<div class="filter-bar">
					<div class="row g-3">
						<div class="col-lg-8">
							<input type="text" id="searchInput"
								class="form-control search-box"
								placeholder="Search by shipment ID, order ID, driver name, or status...">
						</div>
						<div class="col-lg-4">
							<select id="statusFilter" class="form-select filter-select">
								<option value="all">All Status</option>
								<option value="pending">Pending</option>
								<option value="shipped">Shipped</option>
								<option value="delivered">Delivered</option>
								<option value="cancelled">Cancelled</option>
							</select>
						</div>
					</div>
				</div>

				<c:choose>
					<c:when test="${not empty list}">
						<c:set var="shipmentData" value="${list}" />
					</c:when>
					<c:when test="${not empty shipmentList}">
						<c:set var="shipmentData" value="${shipmentList}" />
					</c:when>
					<c:otherwise>
						<c:set var="shipmentData" value="${null}" />
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${not empty shipmentData}">
						<div class="table-responsive">
							<table class="table-custom align-middle text-center"
								id="shipmentTable">
								<thead>
									<tr>
										<th>#</th>
										<th>Shipment ID</th>
										<th>Order ID</th>
										<th>Driver Name</th>
										<th>Status</th>
										<th style="min-width: 290px;">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="s" items="${shipmentData}" varStatus="loop">
										<tr class="shipment-row">
											<td><span class="row-number">${loop.index + 1}</span></td>

											<td class="shipment-id"><strong>${s.id}</strong></td>

											<td class="order-id">${s.orderId}</td>

											<td class="driver-name">
												<div class="driver-wrap">
													<div class="driver-icon">
														<i class="fa-solid fa-user"></i>
													</div>
													<c:choose>
														<c:when test="${not empty s.driverName}">
															<span class="driver-text">${s.driverName}</span>
														</c:when>
														<c:otherwise>
															<span class="driver-empty">Not Assigned</span>
														</c:otherwise>
													</c:choose>
												</div>
											</td>

											<td class="shipment-status"
												data-status="${empty s.status ? 'Pending' : s.status}">
												<c:choose>
													<c:when
														test="${s.status eq 'Pending' || s.status eq 'pending'}">
														<span class="status-badge badge-pending">Pending</span>
													</c:when>
													<c:when
														test="${s.status eq 'Shipped' || s.status eq 'shipped'}">
														<span class="status-badge badge-shipped">Shipped</span>
													</c:when>
													<c:when
														test="${s.status eq 'Delivered' || s.status eq 'delivered'}">
														<span class="status-badge badge-delivered">Delivered</span>
													</c:when>
													<c:when
														test="${s.status eq 'Cancelled' || s.status eq 'cancelled'}">
														<span class="status-badge badge-cancelled">Cancelled</span>
													</c:when>
													<c:otherwise>
														<span class="status-badge badge-default"> ${empty s.status ? 'Pending' : s.status}
														</span>
													</c:otherwise>
												</c:choose>
											</td>

											<td>
												<div class="action-group">
													<a href="viewOrderDetails?orderId=${s.orderId}"
														class="btn-action-mini btn-view"> <i
														class="fa-solid fa-file-lines"></i> View Order
													</a>

													<button type="button" class="btn-action-mini btn-assign"
														data-bs-toggle="modal" data-bs-target="#assignDriverModal"
														data-shipmentid="${s.id}"
														data-drivername="${s.driverName}">
														<i class="fa-solid fa-user-gear"></i> Assign Driver
													</button>

													<button type="button" class="btn-action-mini btn-update"
														data-bs-toggle="modal" data-bs-target="#updateStatusModal"
														data-shipmentid="${s.id}"
														data-status="${empty s.status ? 'Pending' : s.status}">
														<i class="fa-solid fa-pen-to-square"></i> Update Status
													</button>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div id="noResultBox" class="empty-state-box"
							style="display: none;">
							<div class="empty-icon">
								<i class="fa-solid fa-magnifying-glass"></i>
							</div>
							<h3
								style="font-family: 'Space Grotesk', sans-serif; font-weight: 700; margin-bottom: 10px;">No
								matching shipment found</h3>
							<p style="color: var(--text-muted); margin-bottom: 0;">Try
								adjusting your search term or status filter.</p>
						</div>
					</c:when>

					<c:otherwise>
						<div class="empty-state-box">
							<div class="empty-icon">
								<i class="fa-solid fa-truck-ramp-box"></i>
							</div>
							<h3
								style="font-family: 'Space Grotesk', sans-serif; font-weight: 700; margin-bottom: 10px;">No
								shipments available</h3>
							<p style="color: var(--text-muted); margin-bottom: 0;">Once
								shipments are created, they will appear here.</p>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="modal fade" id="assignDriverModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content custom-dark">
					<form
						action="${pageContext.request.contextPath}/admin/updateShipment"
						method="post">
						<div class="modal-header modal-header-custom">
							<h5 class="modal-title modal-title-custom">
								<i class="fa-solid fa-user-gear me-2"></i> Assign Driver
							</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								style="filter: invert(1);"></button>
						</div>

						<div class="modal-body modal-body-custom">
							<input type="hidden" name="id" id="assignShipmentId">

							<div class="mb-3">
								<label class="form-label-custom">Driver Name</label> <input
									type="text" name="driverName" id="assignDriverName"
									class="form-control form-control-custom"
									placeholder="Enter driver name" required>
							</div>

							<input type="hidden" name="status" value="Pending">
						</div>

						<div class="modal-footer modal-footer-custom">
							<button type="button" class="btn-modal-cancel"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn-modal-submit">
								<i class="fa-solid fa-floppy-disk"></i> Save Driver
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="updateStatusModal" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content custom-dark">
					<form
						action="${pageContext.request.contextPath}/admin/updateShipment"
						method="post">
						<div class="modal-header modal-header-custom">
							<h5 class="modal-title modal-title-custom">
								<i class="fa-solid fa-pen-to-square me-2"></i> Update Status
							</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								style="filter: invert(1);"></button>
						</div>

						<div class="modal-body modal-body-custom">
							<input type="hidden" name="id" id="statusShipmentId"> <input
								type="hidden" name="driverName" id="hiddenDriverName">

							<div class="mb-3">
								<label class="form-label-custom">Shipment Status</label> <select
									name="status" id="statusValue"
									class="form-select form-control-custom" required>
									<option value="Pending">Pending</option>
									<option value="Shipped">Shipped</option>
									<option value="Delivered">Delivered</option>
									<option value="Cancelled">Cancelled</option>
								</select>
							</div>
						</div>

						<div class="modal-footer modal-footer-custom">
							<button type="button" class="btn-modal-cancel"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn-modal-submit">
								<i class="fa-solid fa-floppy-disk"></i> Update Status
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
    function updateStats() {
        const rows = document.querySelectorAll(".shipment-row");

        let total = 0;
        let pending = 0;
        let shipped = 0;
        let delivered = 0;

        rows.forEach(row => {
            if (row.style.display !== "none") {
                total++;
                const status = row.querySelector(".shipment-status").getAttribute("data-status").toLowerCase().trim();

                if (status === "pending") pending++;
                else if (status === "shipped") shipped++;
                else if (status === "delivered") delivered++;
            }
        });

        const totalEl = document.getElementById("totalShipments");
        const pendingEl = document.getElementById("pendingCount");
        const shippedEl = document.getElementById("shippedCount");
        const deliveredEl = document.getElementById("deliveredCount");

        if(totalEl) totalEl.textContent = total;
        if(pendingEl) pendingEl.textContent = pending;
        if(shippedEl) shippedEl.textContent = shipped;
        if(deliveredEl) deliveredEl.textContent = delivered;
    }

    function filterShipments() {
        const searchInput = document.getElementById("searchInput");
        const statusFilter = document.getElementById("statusFilter");

        const searchValue = searchInput ? searchInput.value.toLowerCase().trim() : "";
        const statusValue = statusFilter ? statusFilter.value.toLowerCase().trim() : "all";
        const rows = document.querySelectorAll(".shipment-row");
        let visibleCount = 0;

        rows.forEach(row => {
            const shipmentId = row.querySelector(".shipment-id") ? row.querySelector(".shipment-id").textContent.toLowerCase() : "";
            const orderId = row.querySelector(".order-id") ? row.querySelector(".order-id").textContent.toLowerCase() : "";
            const driverName = row.querySelector(".driver-name") ? row.querySelector(".driver-name").textContent.toLowerCase() : "";
            const statusElement = row.querySelector(".shipment-status");
            const status = statusElement ? ((statusElement.getAttribute("data-status") || "Pending").toLowerCase().trim()) : "pending";

            const matchesSearch =
                shipmentId.includes(searchValue) ||
                orderId.includes(searchValue) ||
                driverName.includes(searchValue) ||
                status.includes(searchValue);

            const matchesStatus = statusValue === "all" || status === statusValue;

            if (matchesSearch && matchesStatus) {
                row.style.display = "";
                visibleCount++;
            } else {
                row.style.display = "none";
            }
        });

        const noResultBox = document.getElementById("noResultBox");
        if (noResultBox) {
            noResultBox.style.display = visibleCount === 0 ? "block" : "none";
        }

        updateStats();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const searchInput = document.getElementById("searchInput");
        const statusFilter = document.getElementById("statusFilter");

        if (searchInput) {
            searchInput.addEventListener("keyup", filterShipments);
        }

        if (statusFilter) {
            statusFilter.addEventListener("change", filterShipments);
        }

        const assignDriverModal = document.getElementById('assignDriverModal');
        if (assignDriverModal) {
            assignDriverModal.addEventListener('show.bs.modal', function (event) {
                const button = event.relatedTarget;
                const shipmentId = button.getAttribute('data-shipmentid');
                const driverName = button.getAttribute('data-drivername');

                document.getElementById('assignShipmentId').value = shipmentId || '';
                document.getElementById('assignDriverName').value = (driverName && driverName !== 'null') ? driverName : '';
            });
        }

        const updateStatusModal = document.getElementById('updateStatusModal');
        if (updateStatusModal) {
        	updateStatusModal.addEventListener('show.bs.modal', function (event) {
        	    const button = event.relatedTarget;
        	    const shipmentId = button.getAttribute('data-shipmentid');
        	    const status = button.getAttribute('data-status');

        	    document.getElementById('statusShipmentId').value = shipmentId || '';
        	    document.getElementById('statusValue').value = status || '';

        	    const row = button.closest('tr');
        	    const driverName = row.querySelector('.driver-text') ? row.querySelector('.driver-text').textContent.trim() : '';
        	    document.getElementById('hiddenDriverName').value = driverName;
        	});
        }

        updateStats();
    });
</script>

</body>
</html>