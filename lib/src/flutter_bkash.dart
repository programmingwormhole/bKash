import 'package:flutter/material.dart';
import 'package:flutter_bkash/src/apis/models/token_response_model.dart';
import 'package:flutter_bkash/src/bkash_api.dart';
import 'package:flutter_bkash/src/bkash_credentials.dart';
import 'package:flutter_bkash/src/flutter_bkash_view.dart';
import 'package:fpdart/fpdart.dart';

import 'bkash_payment_response.dart';
import 'bkash_payment_status.dart';
import 'utils/failure.dart';

class FlutterBkash {
  final BkashApi _bkashApi;
  late DateTime _tokenValidity;
  Either<BkashFailure, TokenResponseModel>? _token;

  FlutterBkash({
    BkashCredentials? bkashCredentials,
  }) : _bkashApi = BkashApi(
          bkashCredentials: bkashCredentials ??
              const BkashCredentials(
                username: "sandboxTokenizedUser02",
                password: "sandboxTokenizedUser02@12345",
                appKey: "4f6o0cjiki2rfm34kfdadl1eqq",
                appSecret:
                    "2is7hdktrekvrbljjh44ll3d9l1dtjo4pasmjvs5vl5qr3fug4b",
                isSandbox: true,
              ),
        ) {
    _validateToken();
  }

  Future<void> _validateToken() async {
    if (_token == null) {
      final tokenResponse = await _bkashApi.createToken();
      _token = tokenResponse.fold(
        (l) => left(l),
        (r) {
          if (r.statusCode != "0000") {
            return left(BkashFailure(message: r.statusMessage));
          }
          _tokenValidity = DateTime.now()
              .add(Duration(seconds: r.expiresIn))
              .subtract(const Duration(minutes: 5));
          return right(r);
        },
      );
    } else {
      if (DateTime.now().isBefore(_tokenValidity)) {
        return;
      }
      _token = await _token?.fold(
        (l) async => left(l),
        (r) async {
          final newToken =
              await _bkashApi.refreshToken(refreshToken: r.refreshToken);

          return newToken.fold(
            (l) => left(l),
            (r) {
              if (r.statusCode != "0000") {
                return left(BkashFailure(message: r.statusMessage));
              }
              _tokenValidity = DateTime.now()
                  .add(Duration(seconds: r.expiresIn))
                  .subtract(const Duration(minutes: 5));
              return right(r);
            },
          );
        },
      );
    }
  }

  // pay without agreement
  Future<BkashPaymentResponse> pay({
    required BuildContext context,
    required double amount,
    required String merchantInvoiceNumber,
  }) async {
    await _validateToken();

    final paymentResponse = await _token?.fold<Future<BkashPaymentResponse>>(
      (l) async => throw l,
      (tokenRes) async {
        final apiResponse = await _bkashApi.payWithoutAgreement(
          idToken: tokenRes.idToken,
          amount: amount.toString(),
          marchentInvoiceNumber: merchantInvoiceNumber,
        );

        return await apiResponse.fold<Future<BkashPaymentResponse>>(
          (l) async => throw l,
          (apiRes) async {
            if (apiRes.statusCode != "0000") {
              throw BkashFailure();
            }

            final bkashPaymentStatus = await Navigator.push<BkashPaymentStatus>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlutterBkashView(
                      bkashURL: apiRes.bkashURL,
                      failureCallbackURL: apiRes.failureCallbackURL,
                      successCallbackURL: apiRes.successCallbackURL,
                      cancelledCallbackURL: apiRes.cancelledCallbackURL,
                    ),
                  ),
                ) ??
                BkashPaymentStatus.canceled;

            if (bkashPaymentStatus == BkashPaymentStatus.successed) {
              final result = await _bkashApi.executePayWithoutAgreement(
                paymentId: apiRes.paymentID,
                idToken: tokenRes.idToken,
              );

              return result.fold<BkashPaymentResponse>(
                (l) => throw l,
                (r) {
                  // failed to execute
                  if (r.statusCode != "0000") {
                    throw BkashFailure();
                  }
                  return BkashPaymentResponse(
                    r.paymentExecuteTime,
                    trxId: r.trxID,
                    payerReference: r.payerReference,
                    paymentId: r.paymentID,
                    customerMsisdn: r.customerMsisdn,
                    merchantInvoiceNumber: r.merchantInvoiceNumber,
                  );
                },
              );
            }
            if (bkashPaymentStatus == BkashPaymentStatus.canceled) {
              throw BkashFailure(message: "Payment Cancelled");
            }
            throw BkashFailure();
          },
        );
      },
    );

    if (paymentResponse == null) {
      throw BkashFailure();
    }
    return paymentResponse;
  }

  // after agreement - pay with agreement
  Future<BkashPaymentResponse> payWithAgreement({
    required BuildContext context,
    required double amount,
    required String agreementId,
    required String marchentInvoiceNumber,
  }) async {
    await _validateToken();

    final paymentResponse = await _token?.fold<Future<BkashPaymentResponse>>(
      (l) async => throw l,
      (tokenRes) async {
        final apiResponse = await _bkashApi.payWithAgreement(
          idToken: tokenRes.idToken,
          agreementId: agreementId,
          amount: amount.toString(),
          marchentInvoiceNumber: marchentInvoiceNumber,
        );

        return await apiResponse.fold<Future<BkashPaymentResponse>>(
          (l) async => throw l,
          (apiRes) async {
            if (apiRes.statusCode != "0000") {
              throw BkashFailure();
            }

            final bkashPaymentStatus = await Navigator.push<BkashPaymentStatus>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlutterBkashView(
                      bkashURL: apiRes.bkashURL,
                      failureCallbackURL: apiRes.failureCallbackURL,
                      successCallbackURL: apiRes.successCallbackURL,
                      cancelledCallbackURL: apiRes.cancelledCallbackURL,
                    ),
                  ),
                ) ??
                BkashPaymentStatus.canceled;

            if (bkashPaymentStatus == BkashPaymentStatus.successed) {
              final result = await _bkashApi.executePayWithAgreement(
                paymentId: apiRes.paymentID,
                idToken: tokenRes.idToken,
              );

              return result.fold<BkashPaymentResponse>(
                (l) => throw l,
                (r) {
                  // failed to execute
                  if (r.statusCode != "0000") {
                    throw BkashFailure();
                  }
                  return BkashPaymentResponse(
                    r.paymentExecuteTime,
                    trxId: r.trxID,
                    payerReference: r.payerReference,
                    paymentId: r.paymentID,
                    customerMsisdn: r.customerMsisdn,
                    merchantInvoiceNumber: r.merchantInvoiceNumber,
                  );
                },
              );
            }
            if (bkashPaymentStatus == BkashPaymentStatus.canceled) {
              throw BkashFailure(message: "Payment Cancelled");
            }
            throw BkashFailure();
          },
        );
      },
    );

    if (paymentResponse == null) {
      throw BkashFailure();
    }
    return paymentResponse;
  }

  // create agreement when first time create to agreement
  Future<BkashAgreementResponse> createAgreement({
    required BuildContext context,
  }) async {
    await _validateToken();

    final paymentResponse = await _token?.fold<Future<BkashAgreementResponse>>(
      (l) async => throw l,
      (tokenRes) async {
        final agreementResponse =
            await _bkashApi.createAgreement(idToken: tokenRes.idToken);

        return await agreementResponse.fold<Future<BkashAgreementResponse>>(
          (l) async => throw l,
          (agrRes) async {
            if (agrRes.statusCode != "0000") {
              throw BkashFailure();
            }

            final bkashPaymentStatus = await Navigator.push<BkashPaymentStatus>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlutterBkashView(
                      bkashURL: agrRes.bkashURL,
                      failureCallbackURL: agrRes.failureCallbackURL,
                      successCallbackURL: agrRes.successCallbackURL,
                      cancelledCallbackURL: agrRes.cancelledCallbackURL,
                    ),
                  ),
                ) ??
                BkashPaymentStatus.canceled;

            if (bkashPaymentStatus == BkashPaymentStatus.successed) {
              final result = await _bkashApi.executeCreateAgreement(
                paymentId: agrRes.paymentID,
                idToken: tokenRes.idToken,
              );

              return result.fold<BkashAgreementResponse>(
                (l) => throw l,
                (r) {
                  // failed to execute
                  if (r.statusCode != "0000") {
                    throw BkashFailure();
                  }
                  return BkashAgreementResponse(
                    r.agreementExecuteTime,
                    payerReference: r.payerReference,
                    paymentId: r.paymentID,
                    customerMsisdn: r.customerMsisdn,
                    agreementId: r.agreementID,
                  );
                },
              );
            }
            if (bkashPaymentStatus == BkashPaymentStatus.canceled) {
              throw BkashFailure(message: "Agreement creation Cancelled");
            }
            throw BkashFailure();
          },
        );
      },
    );

    if (paymentResponse == null) {
      throw BkashFailure();
    }
    return paymentResponse;
  }
}
